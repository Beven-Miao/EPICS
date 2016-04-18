TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#=============================
# Build the IOC support library

LIBRARY_IOC += acSupport

# xxxRecord.h will be created from xxxRecord.dbd
DBDINC += xxxRecord
# Install devXxxSoft.dbd into <top>/dbd
DBD += xxxSupport.dbd

# Compile and add the code to the support library
acSupport_SRCS += xxxRecord.c
acSupport_SRCS += devXxxSoft.c

# Link locally-provided code into the support library,
# rather than directly into the IOC application.
acSupport_SRCS += dbSubExample.c
acSupport_SRCS += acHello.c
acSupport_SRCS += initTrace.c

acSupport_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
# Build the IOC application

PROD_IOC = ac
# ac.dbd will be created and installed
DBD += ac.dbd

# ac.dbd will be made up from these files:
ac_DBD += base.dbd
ac_DBD += xxxSupport.dbd
ac_DBD += dbSubExample.dbd
ac_DBD += acHello.dbd
ac_DBD += initTrace.dbd

# ac_registerRecordDeviceDriver.cpp derives from ac.dbd
ac_SRCS += ac_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
ac_SRCS_DEFAULT += acMain.cpp
ac_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#ac_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link in the code from the support library
ac_LIBS += acSupport

# NOTE: To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file

ifneq ($(SNCSEQ),)
    # Build sncExample into acSupport
    sncExample_SNCFLAGS += +r
    ac_DBD += sncExample.dbd
    acSupport_SRCS += sncExample.stt
    acSupport_LIBS += seq pv
    ac_LIBS += seq pv
    ac_DBD += acsnc.dbd
    ac_SRCS += acsnc.stt

    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

# Finally link to the EPICS Base libraries
ac_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

