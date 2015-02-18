#include "stdlib.h"
#include "math.h"
#include "mbed.h"
#include "rtos.h"
#include "MMA7660.h"
#include "C12832.h"

DigitalOut myled(LED1);
MMA7660 MMA(p28,p27);
C12832 lcd(p5,p7,p6,p8,p11);
BusOut colorled(p23,p24,p25);

Mutex cookie_mutex;
long cookie=0;

double lastX=0;
double lastY=0;
double lastZ=0;
bool init=false;
double distance(double x, double y, double z){
	return sqrt(pow(lastX-x,2)+pow(lastY-y,2)+pow(lastZ-z,2));
}
bool thinOut=false;
bool isShaked(double x, double y, double z){
    bool ret=false;
	if(!init){
		init = true;
	}else{
        if(distance(x,y,z)>2.0){
        	thinOut=!thinOut;
            ret = thinOut;
        }
	}
	lastX = x;
	lastY = y;
	lastZ = z;
	return ret;
}
void lightChange(){
    colorled=colorled+1;
    if(colorled==8){
        colorled=1;
    }
}

void bakeCookie(){
    cookie_mutex.lock();
    cookie++;
    lcd.locate(0,0);
    lcd.printf("%d",cookie);
    lightChange();
    cookie_mutex.unlock();
}


void mma_read(void const* args){
	if(MMA.testConnection())
		printf("Successfully connected MMA");
	else
		printf("Failed to connect MMA");
    while(1) {
    	double x = MMA.x();
    	double y = MMA.y();
    	double z = MMA.z();
        if(isShaked(x,y,z)){
            bakeCookie();
    	}
    	Thread::wait(100);
    }
}
int main() {
	Thread mma_thread(mma_read);
    colorled=0;
    while (true) {
    	Thread::wait(1000);
    }
}
