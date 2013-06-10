################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/main.c \
../src/uvcdatWrappers.c 

OBJS += \
./src/main.o \
./src/uvcdatWrappers.o 

C_DEPS += \
./src/main.d \
./src/uvcdatWrappers.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -I"/Users/tpmaxwell/Development/ClimateDataServices/cdmsWrapperTest/include" -I/usr/local/uvcdat/1.3.1/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/config -I/usr/local/uvcdat/1.3.1/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/numpy/core/include/numpy -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


