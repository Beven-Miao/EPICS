#Second A/C app with variable power, cooling and heating#

##Files created and modified:

	- + ./SecondACApp/Db/dbAirCondSys.db
	- + ./SecondACApp/Db/ACSys.substitutions
	- m ./SecondACApp/Db/Makefile
	- m ./iocBoot/iocSecondACApp/st.cmd

##Build:

	make

##Run the ioc

	cd ./iocBoot/iocSecondACApp/
	chmod +x st.cmd
	./st.cmd

##Monitor:
### monitor temperature

	camonitor $(user):odt  // outdoor temperature
	camonitor $(user):idt  // indoor temperature

### monitor AC state: 0 -> off; 1 -> heating; -1 -> cooling.

	camonitor $(user):calcAutoSwitch // Auto AC state
	camonitor $(user):aiMode         // Manual AC state: override auto state; 2 -> manual off.

### monitor the power AC generated

	camonitor $(user):calcAirCondCore  // Unit: degree per second

##User Configuration:

	caput $(user):aiMode -1/0/1/2   // Manually change the AC state
	caput $(user):aiPreSetTmp n     // Set the desired temperature
	caput $(user):aiPower     n(<MaxPower) // Set the AC power


