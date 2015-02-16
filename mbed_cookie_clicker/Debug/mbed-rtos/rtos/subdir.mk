################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../mbed-rtos/rtos/Mutex.cpp \
../mbed-rtos/rtos/RtosTimer.cpp \
../mbed-rtos/rtos/Semaphore.cpp \
../mbed-rtos/rtos/Thread.cpp 

OBJS += \
./mbed-rtos/rtos/Mutex.o \
./mbed-rtos/rtos/RtosTimer.o \
./mbed-rtos/rtos/Semaphore.o \
./mbed-rtos/rtos/Thread.o 

CPP_DEPS += \
./mbed-rtos/rtos/Mutex.d \
./mbed-rtos/rtos/RtosTimer.d \
./mbed-rtos/rtos/Semaphore.d \
./mbed-rtos/rtos/Thread.d 


# Each subdirectory must supply rules for building sources it contributes
mbed-rtos/rtos/%.o: ../mbed-rtos/rtos/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C++ Compiler'
	arm-none-eabi-c++ -D__NEWLIB__ -D__CODE_RED -DCPP_USE_HEAP -DTARGET_LPC1768 -DTARGET_M3 -DTARGET_CORTEX_M -DTARGET_NXP -DTARGET_LPC176X -DTARGET_MBED_LPC1768 -DTOOLCHAIN_GCC_CR -DTOOLCHAIN_GCC -D__CORTEX_M3 -DARM_MATH_CM3 -DMBED_BUILD_TIMESTAMP=1424086677.64 -D__MBED__=1 -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/mbed" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/mbed/TARGET_LPC1768" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/mbed/TARGET_LPC1768/TOOLCHAIN_GCC_CR" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/mbed/TARGET_LPC1768/TARGET_NXP" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/mbed/TARGET_LPC1768/TARGET_NXP/TARGET_LPC176X" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/mbed/TARGET_LPC1768/TARGET_NXP/TARGET_LPC176X/TARGET_MBED_LPC1768" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/MMA7660" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/C12832" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/mbed-rtos" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/mbed-rtos/rtx" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/mbed-rtos/rtx/TARGET_CORTEX_M" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/mbed-rtos/rtx/TARGET_CORTEX_M/TARGET_M3" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/mbed-rtos/rtx/TARGET_CORTEX_M/TARGET_M3/TOOLCHAIN_GCC" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/mbed-rtos/rtos" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -mcpu=cortex-m3 -mthumb -D__NEWLIB__ -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


