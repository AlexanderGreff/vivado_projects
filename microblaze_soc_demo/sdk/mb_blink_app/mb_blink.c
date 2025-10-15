//mb_blink.c
//
//Provided boilerplate "LED Blink" code for ECE 385
//First released in ECE 385, Fall 2023 distribution
//
//Note: you will have to refer to the memory map of your MicroBlaze
//system to find the proper address for the LED GPIO peripheral.
//
//Modified on 7/25/23 Zuofu Cheng

#include <stdio.h>
#include <xparameters.h>
#include <xil_types.h>
#include <sleep.h>

// #include "platform.h"

volatile uint32_t* led_gpio_data = (volatile uint32_t*)((uintptr_t)XPAR_AXI_GPIO_0_BASEADDR); // from base addr value found in xparameters.h
volatile uint32_t* sw_gpio_data = (volatile uint32_t*)((uintptr_t)XPAR_AXI_GPIO_1_BASEADDR);
volatile uint32_t* btn1_gpio_data = (volatile uint32_t*)((uintptr_t)XPAR_AXI_GPIO_2_BASEADDR);



															  //Hint: either find the manual address (via the memory map in the block diagram, or
															 //replace with the proper define in xparameters (part of the BSP). Either way
															 //this is the base address of the GPIO corresponding to your LEDs
															 //(similar to 0xFFFF from MEM2IO from previous labs).

int main()
{
	uint16_t accumulator = 0;
	uint16_t accumulator_prev = 0;
	while (1)
	{
		if (*btn1_gpio_data == 0) //active low btn[1]
		{
			accumulator_prev = accumulator;
			accumulator += *sw_gpio_data; 
			if (accumulator_prev > accumulator)
			{
				xil_printf("accumulator overflow!\r\n");
			}
			xil_printf("accumulator = %u\r\n", accumulator);
			while (*btn1_gpio_data == 0)
			{
				msleep(20);
			}
			msleep(1);
		}
	}
    return 0;
}
