################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../mbed-rtos/rtx/TARGET_CORTEX_M/HAL_CM.c \
../mbed-rtos/rtx/TARGET_CORTEX_M/RTX_Conf_CM.c \
../mbed-rtos/rtx/TARGET_CORTEX_M/rt_CMSIS.c \
../mbed-rtos/rtx/TARGET_CORTEX_M/rt_Event.c \
../mbed-rtos/rtx/TARGET_CORTEX_M/rt_List.c \
../mbed-rtos/rtx/TARGET_CORTEX_M/rt_Mailbox.c \
../mbed-rtos/rtx/TARGET_CORTEX_M/rt_MemBox.c \
../mbed-rtos/rtx/TARGET_CORTEX_M/rt_Mutex.c \
../mbed-rtos/rtx/TARGET_CORTEX_M/rt_Robin.c \
../mbed-rtos/rtx/TARGET_CORTEX_M/rt_Semaphore.c \
../mbed-rtos/rtx/TARGET_CORTEX_M/rt_System.c \
../mbed-rtos/rtx/TARGET_CORTEX_M/rt_Task.c \
../mbed-rtos/rtx/TARGET_CORTEX_M/rt_Time.c 

OBJS += \
./mbed-rtos/rtx/TARGET_CORTEX_M/HAL_CM.o \
./mbed-rtos/rtx/TARGET_CORTEX_M/RTX_Conf_CM.o \
./mbed-rtos/rtx/TARGET_CORTEX_M/rt_CMSIS.o \
./mbed-rtos/rtx/TARGET_CORTEX_M/rt_Event.o \
./mbed-rtos/rtx/TARGET_CORTEX_M/rt_List.o \
./mbed-rtos/rtx/TARGET_CORTEX_M/rt_Mailbox.o \
./mbed-rtos/rtx/TARGET_CORTEX_M/rt_MemBox.o \
./mbed-rtos/rtx/TARGET_CORTEX_M/rt_Mutex.o \
./mbed-rtos/rtx/TARGET_CORTEX_M/rt_Robin.o \
./mbed-rtos/rtx/TARGET_CORTEX_M/rt_Semaphore.o \
./mbed-rtos/rtx/TARGET_CORTEX_M/rt_System.o \
./mbed-rtos/rtx/TARGET_CORTEX_M/rt_Task.o \
./mbed-rtos/rtx/TARGET_CORTEX_M/rt_Time.o 

C_DEPS += \
./mbed-rtos/rtx/TARGET_CORTEX_M/HAL_CM.d \
./mbed-rtos/rtx/TARGET_CORTEX_M/RTX_Conf_CM.d \
./mbed-rtos/rtx/TARGET_CORTEX_M/rt_CMSIS.d \
./mbed-rtos/rtx/TARGET_CORTEX_M/rt_Event.d \
./mbed-rtos/rtx/TARGET_CORTEX_M/rt_List.d \
./mbed-rtos/rtx/TARGET_CORTEX_M/rt_Mailbox.d \
./mbed-rtos/rtx/TARGET_CORTEX_M/rt_MemBox.d \
./mbed-rtos/rtx/TARGET_CORTEX_M/rt_Mutex.d \
./mbed-rtos/rtx/TARGET_CORTEX_M/rt_Robin.d \
./mbed-rtos/rtx/TARGET_CORTEX_M/rt_Semaphore.d \
./mbed-rtos/rtx/TARGET_CORTEX_M/rt_System.d \
./mbed-rtos/rtx/TARGET_CORTEX_M/rt_Task.d \
./mbed-rtos/rtx/TARGET_CORTEX_M/rt_Time.d 


# Each subdirectory must supply rules for building sources it contributes
mbed-rtos/rtx/TARGET_CORTEX_M/%.o: ../mbed-rtos/rtx/TARGET_CORTEX_M/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__NEWLIB__ -D__CODE_RED -DCPP_USE_HEAP -DTARGET_LPC1768 -DTARGET_M3 -DTARGET_CORTEX_M -DTARGET_NXP -DTARGET_LPC176X -DTARGET_MBED_LPC1768 -DTOOLCHAIN_GCC_CR -DTOOLCHAIN_GCC -D__CORTEX_M3 -DARM_MATH_CM3 -DMBED_BUILD_TIMESTAMP=1424086677.64 -D__MBED__=1 -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/mbed" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/mbed/TARGET_LPC1768" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/mbed/TARGET_LPC1768/TOOLCHAIN_GCC_CR" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/mbed/TARGET_LPC1768/TARGET_NXP" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/mbed/TARGET_LPC1768/TARGET_NXP/TARGET_LPC176X" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/mbed/TARGET_LPC1768/TARGET_NXP/TARGET_LPC176X/TARGET_MBED_LPC1768" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/MMA7660" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/C12832" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/mbed-rtos" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/mbed-rtos/rtx" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/mbed-rtos/rtx/TARGET_CORTEX_M" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/mbed-rtos/rtx/TARGET_CORTEX_M/TARGET_M3" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/mbed-rtos/rtx/TARGET_CORTEX_M/TARGET_M3/TOOLCHAIN_GCC" -I"/Users/akihiro/LPCXpresso/workspace/mbed_cookie_clicker/mbed-rtos/rtos" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -mcpu=cortex-m3 -mthumb -D__NEWLIB__ -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


