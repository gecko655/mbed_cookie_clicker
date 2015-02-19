#include "stdlib.h"
#include "math.h"
#include "mbed.h"
#include "rtos.h"
#include "MMA7660.h"
#include "C12832.h"

#include "tippy.h"

DigitalOut myled(LED1);
InterruptIn button(p14);
MMA7660 MMA(p28, p27);
C12832 lcd(p5, p7, p6, p8, p11);
BusOut colorled(p23, p24, p25);

Mutex cookie_mutex;
Mutex print_mutex;
long cookie = 0;
int tippy;
int cost;

Timer t;
double lastAX = 0;
double lastAY = 0;
double lastAZ = 0;
int lastTime = t.read_ms();

inline double square(double x) {
    return x*x;
}

inline double getJerk(double x, double y, double z, int time) {
    return sqrt(square(lastAX - x) + square(lastAY - y) + square(lastAZ - z))/(time-lastTime)*1000;
}
bool schmittTriger = false;
double thresholdUpper = 100;//[m/s/s/s]
double thresholdLower = 0.01;//[m/s/s/s]
bool isShaked(double ax, double ay, double az) {
    bool ret = false;
    int time = t.read_ms();
    if (getJerk(ax, ay, az, time) > thresholdUpper && !schmittTriger) {
        schmittTriger=true;
        ret = true;
    } else if (getJerk(ax, ay, az, time) < thresholdLower && schmittTriger) {
        schmittTriger=false;
        ret = false;
    }
    lastAX = ax;
    lastAY = ay;
    lastAZ = az;
    lastTime = time;
    return ret;
}
void lightChange() {
    printf("%d\n",colorled.read());
    colorled = colorled + 1;
    if (colorled.read() == 7) {
        colorled = 0;
    }
}
void print(){
    print_mutex.lock();
    lcd.cls();
    lcd.locate(0, 0);
    lcd.printf("Cookie: %d\n", cookie);
    lcd.locate(64, 0);
    lcd.printf("Tippy cost:%d",cost);
    lcd.locate(64, 0);
    lcd.printf("Tippy cost:%d",cost);
    lcd.print_bm(tippyBmp,1+(cookie-1)*tippyBmp.xSize,16);
    lcd.copy_to_lcd();
    print_mutex.unlock();
}

void bakeCookie() {
    cookie_mutex.lock();
    cookie++;
    print();
    lightChange();
    cookie_mutex.unlock();
}

void tippy_buy() {
    cookie_mutex.lock();
    if(cookie>=cost){
        cookie-=cost;
        tippy++;
        cost+=tippy*10;
        print();
    }
    cookie_mutex.unlock();
}
void mma_read(void const* args) {
    while (1) {
        double x = MMA.x();
        double y = MMA.y();
        double z = MMA.z();
        if (isShaked(x, y, z)) {
            bakeCookie();
        }
        Thread::wait(10);
    }
}
void init(){
    t.start();
    if (MMA.testConnection())
        printf("Successfully connected MMA");
    else
        printf("Failed to connect MMA");
    lastAX = MMA.x();
    lastAY = MMA.y();
    lastAZ = MMA.z();
    lastTime = t.read_ms();
    colorled = 7;
    tippy = 0;
    cost=10;
}
int main() {
    Thread mma_thread(mma_read);
    button.rise(tippy_buy);
    init();
    while (true) {
        Thread::wait(1000);
    }
}
