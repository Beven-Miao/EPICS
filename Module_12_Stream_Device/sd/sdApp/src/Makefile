TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#=============================
# Build the IOC support library

LIBRARY_IOC += sdSupport

# xxxRecord.h will be created from xxxRecord.dbd
DBDINC += xxxRecord
# Install devXxxSoft.dbd into <top>/dbd
DBD += xxxSupport.dbd

# Compile and add the code to the support library
sdSupport_SRCS += xxxRecord.c
sdSupport_SRCS += devXxxSoft.c

# Link locally-provided code into the support library,
# rather than directly into the IOC application.
sdSupport_SRCS += dbSubExample.c
sdSupport_SRCS += sdHello.c
sdSupport_SRCS += initTrace.c

sdSupport_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
# Build the IOC application

PROD_IOC = sd
PROD_LIBS += stream
PROD_LIBS += asyn
# sd.dbd will be created and installed
DBD += sd.dbd

# sd.dbd will be made up from these files:
sd_DBD += base.dbd
sd_DBD += xxxSupport.dbd
sd_DBD += dbSubExample.dbd
sd_DBD += sdHello.dbd
sd_DBD += initTrace.dbd
sd_DBD += sdAppInclude.dbd

# sd_registerRecordDeviceDriver.cpp derives from sd.dbd
sd_SRCS += sd_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
sd_SRCS_DEFAULT += sdMain.cpp
sd_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#sd_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link in the code from the support library
sd_LIBS += sdSupport

# NOTE: To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file

ifneq ($(SNCSEQ),)
    # Build sncExample into sdSupport
    sncExample_SNCFLAGS += +r
    sd_DBD += sncExample.dbd
    sdSupport_SRCS += sncExample.stt
    sdSupport_LIBS += seq pv
    sd_LIBS += seq pv

    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

# Finally link to the EPICS Base libraries
sd_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

