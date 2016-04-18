TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#=============================
# Build the IOC support library

LIBRARY_IOC += AirCondSysSupport

# xxxRecord.h will be created from xxxRecord.dbd
DBDINC += xxxRecord
# Install devXxxSoft.dbd into <top>/dbd
DBD += xxxSupport.dbd

# Compile and add the code to the support library
AirCondSysSupport_SRCS += xxxRecord.c
AirCondSysSupport_SRCS += devXxxSoft.c

# Link locally-provided code into the support library,
# rather than directly into the IOC application.
AirCondSysSupport_SRCS += dbSubExample.c
AirCondSysSupport_SRCS += AirCondSysHello.c
AirCondSysSupport_SRCS += initTrace.c

AirCondSysSupport_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
# Build the IOC application

PROD_IOC = AirCondSys
# AirCondSys.dbd will be created and installed
DBD += AirCondSys.dbd

# AirCondSys.dbd will be made up from these files:
AirCondSys_DBD += base.dbd
AirCondSys_DBD += xxxSupport.dbd
AirCondSys_DBD += dbSubExample.dbd
AirCondSys_DBD += AirCondSysHello.dbd
AirCondSys_DBD += initTrace.dbd

# AirCondSys_registerRecordDeviceDriver.cpp derives from AirCondSys.dbd
AirCondSys_SRCS += AirCondSys_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
AirCondSys_SRCS_DEFAULT += AirCondSysMain.cpp
AirCondSys_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#AirCondSys_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link in the code from the support library
AirCondSys_LIBS += AirCondSysSupport

# NOTE: To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file

ifneq ($(SNCSEQ),)
    # Build sncExample into AirCondSysSupport
    sncExample_SNCFLAGS += +r
    AirCondSys_DBD += sncExample.dbd
    AirCondSysSupport_SRCS += sncExample.stt
    AirCondSysSupport_LIBS += seq pv
    AirCondSys_LIBS += seq pv

    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

# Finally link to the EPICS Base libraries
AirCondSys_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

