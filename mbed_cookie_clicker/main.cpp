#include "mbed.h"
#include "MMA7660.h"
#include "C12832.h"

DigitalOut myled(LED1);
MMA7660 MMA(p28,p27);
C12832 lcd(p5,p7,p6,p8,p11);

int main() {
	if(MMA.testConnection())
		printf("Successfully connected to MMA");
    while(1) {
    	printf("%.3lf,%.3lf,%.3lf\n",MMA.x(),MMA.y(),MMA.z());
    	wait(0.5);
    }
}
