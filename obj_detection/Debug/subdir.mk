################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../AdaBoost.cpp \
../CascadeTrainer.cpp \
../DataSet.cpp \
../DecisionStump.cpp \
../Feature.cpp \
../utils.cpp 

OBJS += \
./AdaBoost.o \
./CascadeTrainer.o \
./DataSet.o \
./DecisionStump.o \
./Feature.o \
./utils.o 

CPP_DEPS += \
./AdaBoost.d \
./CascadeTrainer.d \
./DataSet.d \
./DecisionStump.d \
./Feature.d \
./utils.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 --std=c++0x -fPIC -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


