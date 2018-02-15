################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Aula00/02.c \
../Aula00/FirstProgram.c 

OBJS += \
./Aula00/02.o \
./Aula00/FirstProgram.o 


# Each subdirectory must supply rules for building sources it contributes
Aula00/%.o: ../Aula00/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: XL C Compiler'
	/usr/vacpp/bin/xlc -c -O0 -g -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


