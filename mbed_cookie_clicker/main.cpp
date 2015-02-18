#include "stdlib.h"
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

int lastX=0;
int lastY=0;
int lastZ=0;

bool isShaked(int x, int y, int z){
	if(x==lastX
			&&y==lastY
			&&z==lastZ){
		return false;
	}
	lastX = x;
	lastY = y;
	lastZ = z;
	return true;
}
int sgn(double arg){
	return
			arg==0? 0 :
            arg> 0? 1 :
			-1;
}

void bakeCookie(){
    cookie_mutex.lock();
    cookie++;
    lcd.locate(0,0);
    lcd.printf("%d",cookie);
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
    	double ax = fabs(x);
    	double ay = fabs(y);
    	double az = fabs(z);
    	if(ax>1.3&&ay>1.3&&az<=0.5){
    		if(isShaked(sgn(x),sgn(y),0)){
    			bakeCookie();
    		}
    	}else if(ay>1.3&&az>1.3&&ax<=0.5){
    		if(isShaked(0,sgn(y),sgn(z))){
    			bakeCookie();
    		}
    	}else if(az>1.3&&ax>1.3&&ay<=0.5){
    		if(isShaked(sgn(x),0,sgn(z))){
    			bakeCookie();
    		}
    	}
    	Thread::wait(10);
    }
}

int main() {
	Thread mma_thread(mma_read);
    colorled=0;
    while (true) {
        colorled=colorled+1;
        if(colorled==8){
            colorled=0;
        }
        Thread::wait(500);
    }
}
