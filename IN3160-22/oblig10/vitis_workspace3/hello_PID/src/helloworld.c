/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * GPIO PID control by Yngve Hafting, UIO
 * derived from helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include <xgpio.h>
#include <xparameters.h>
#include "sleep.h"
#include <stdbool.h>

#define OUT_PORT 1  // because we have configured our GPIOPORT this way
#define IN_PORT 2   // because we have configured our GPIOPORT this way

#define VELOCITY_TO_SETPOINT_SCALE 320 // 1024*40/128 (40 is assumed speed at 100% duty cycle, +-128 is +-100%).

int main()
{
	XGpio myGPIOport;

	// The direction should be decided before attempting PID control
	bool reverseDirection = false;  // test can be performed using runDirect.

	//PID variables will be maintained by myPid()
	int currentError =0;
	int previousError = 0;
	int sumError = 0;
	int deltaError = 0;

	// read velocity from GPIO-port
	int readVelocity(bool reverse){
		int velocity;
		velocity = XGpio_DiscreteRead(&myGPIOport, IN_PORT);  // read velocity
		if (velocity > 128) velocity = velocity -256; // correct for negative values
		if (reverse) return -velocity; // correct for reverse operation.
		return velocity;
	}

	// print velocity to UART (usually /dev/ttyACM0)
	void printVelocity(){
		int velocity;
		velocity = readVelocity(reverseDirection);
		xil_printf("Velocity = %d rotations per 10s \n\r", velocity);
	}

	// set the setpoint using the GPIO port
	void setGPIO(int mySetPoint){
		XGpio_DiscreteWrite(&myGPIOport, OUT_PORT, mySetPoint);
		usleep(50000); // 50 us delay
	}

	// myPID shall return a setpoint value in the range [-128 to +127] for pulse width modulation
	// Setpoint should be in the range of -40 to +40
	int myPID(int mySetPoint, int myKp, int myKi, int myKd){
		int velocity;
		int P, I, D;  // Constants should be in the range of +-2*VELOCITY_TO_SETPOINT_SCALE
		int PID;
		// error calculations, all scaled up by SETPOINT_SCALE
		previousError = currentError;
		velocity = readVelocity(reverseDirection);
		currentError = mySetPoint - velocity;
		sumError = sumError + currentError;
		deltaError = currentError - previousError;

		// Calculate P,I,D
		P = myKp*currentError;
		I = myKi*sumError;
		D = myKd*deltaError;
		PID = (P+I+D)/VELOCITY_TO_SETPOINT_SCALE;

		// truncate to legal values
		if (PID > 127) {
			xil_printf("PID Value > 127:  %d, P: %d, I: %d D: %d \n\r", PID, P, I, D);
			PID = 127;
		}
		if (PID < -128) {
			xil_printf("PID Value < -128:  %d  P: %d, I: %d D: %d \n\r", PID, P, I, D);
			PID = -128;
		}
		return PID;
	}

	void stopMotor(){
		setGPIO(0); // order a stop
		usleep(300000); // 300 ms delay
	}

	void runPID(int setPoint, int P, int I, int D, int iterations){
		int it=0;
		int set = setPoint;
		xil_printf("setpoint:  %d, P: %d, I: %d D: %d   \n\r", set, P, I, D);
		while(it < iterations){
			setGPIO(myPID(set,P, I, D));
			it++;
			if (it%20 == 0) printVelocity(); // display velocity some times
		}
		stopMotor();
		readVelocity(reverseDirection);
	}

	bool runDirect(int pulseWidth, int iterations){
		int it = 0;
		bool reverse = false;
		xil_printf("pulse width value:  %d, range [-128,128> \n\r", pulseWidth);
		while (it< iterations){
			setGPIO(pulseWidth);
			it++;
			if (it%20 == 0) printVelocity(); // display velocity some times
			// check for reverse operation at 30 iterations
			if (it == 30){
				if (readVelocity(false) > 0){
					if (pulseWidth < 0) reverse = true;
				} else {
					if (pulseWidth > 0) reverse = true;
				}
			}
		}
		stopMotor();
		readVelocity(false);
		return reverse;
	}

	// Initialize communication using GPIO-port
	XGpio_Initialize(&myGPIOport, XPAR_AXI_GPIO_0_DEVICE_ID);  // set myGPIOPort to correct address.
	XGpio_SetDataDirection(&myGPIOport, OUT_PORT, 0x0); //Set first channel to output; -- or should it be 0x00
	XGpio_SetDataDirection(&myGPIOport, IN_PORT, 0xF);  //Set second channel to input; --                 0xFF ?

    init_platform();

    // Launch the show..!
    print(" \n\r");
    print("********************* \n\r");
    print("* PWM and PID test  * \n\r");
    print("********************* \n\r");
    print("*  max speed = 40   * \n\r");
    print("* rounds per 10s at * \n\r");
    print("*  100% duty cycle  * \n\r");
    print("********************* \n\r");

    print(" \n\r");
    print("STEP0: Deciding direction \n\r");
    print(" \n\r");
    print("*** 100% duty cycle (full power) *** \n\r");
    reverseDirection = runDirect(127, 100); // 100 iterations of 50 us

    if (reverseDirection){
    	print ("Reversed operation detected \n\r");
    	print ("Speed readout will be reversed \n\r");
    } else {
    	print ("Forward operation detected\n\r");
    }
    print(" \n\r");
	print("IF the motor has not engaged yet, please revise the system setup...\n\r");

	print(" \n\r");
	print(" \n\r");
	usleep(1000000);


    print("STEP1: PWM set directly\n\r");
    print(" \n\r");
    print("*** 50% duty cycle (1/2 power) *** \n\r");
    runDirect(64, 100); // 100 iterations (each 50 us)

    print(" \n\r");
    print("*** 12,5% duty cycle (1/8 power) ***\n\r");
    runDirect(16, 100); // 128/8 = 16

    print(" \n\r");
    print("*** 3% duty cycle (1/32 power) ***\n\r");
    runDirect(4, 100);

    print(" \n\r");
    print("--- PWM test finished ---  \n\r");
    usleep(1000000);

    print(" \n\r");
    print(" \n\r");
    print("STEP2: Speed constant, testing PID parameters... \n\r");
    print(" \n\r");
    print("*** 50% speed, only P   *** \n\r");
    print("*** setpoint = 20 r/10s ***\n\r");
    runPID(20, 800, 0, 0, 100);

    print(" \n\r");
    print(" \n\r");
    usleep(1000000);

    print("*** 50% speed, P + I    ***\n\r");
    print("*** setpoint = 20 r/10s ***\n\r");
    runPID(20, 800, 50, 0, 100);

    print(" \n\r");
    print(" \n\r");
	usleep(1000000);

    print("*** 50% speed, P I D    ***\n\r");
    print("*** setpoint = 20 r/10s ***\n\r");
    runPID(20, 800, 50, 130, 100); // Half speed, P+I+D

    print(" \n\r");
    print(" \n\r");
    usleep(1000000);

    print("STEP3: PID testing PID at different speed\n\r");
    print(" \n\r");
    print("*** 12,5% speed, P I D ***\n\r");
    print("*** setpoint = 5 r/10s ***\n\r");
    runPID(5, 800, 50, 130, 100); // 1/8 of max speed , PID

    print(" \n\r");
    print("*** -75% speed, P I D                    ***\n\r");
    print("*** setpoint = -30 rounds per 10 seconds ***\n\r");
	runPID(-30, 800, 50, 130, 100);

	print(" \n\r");
	print("*** -5% speed, P I D                    ***\n\r");
	print("*** setpoint = -2 rounds per 10 seconds ***\n\r");
	runPID(-2, 800, 50, 130, 100);

	print(" \n\r");
	print("***              FINISHED              ***\n\r");
	print("***      If you are using screen,      ***\n\r");
	print("*** press Ctrl-A then k then y to quit ***\n\r");
  print("***                 --                 ***\n\r");
  print("***  press Ctrl-A then ESC to enable   ***\n\r");
  print("***     scrolling using arrow keys     ***\n\r");
	print(" \n\r");
    cleanup_platform();
    return 0;
}
