TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#=============================
# Build the IOC support library

LIBRARY_IOC += SecondACSupport

# xxxRecord.h will be created from xxxRecord.dbd
DBDINC += xxxRecord
# Install devXxxSoft.dbd into <top>/dbd
DBD += xxxSupport.dbd

# Compile and add the code to the support library
SecondACSupport_SRCS += xxxRecord.c
SecondACSupport_SRCS += devXxxSoft.c

# Link locally-provided code into the support library,
# rather than directly into the IOC application.
SecondACSupport_SRCS += dbSubExample.c
SecondACSupport_SRCS += SecondACHello.c
SecondACSupport_SRCS += initTrace.c

SecondACSupport_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
# Build the IOC application

PROD_IOC = SecondAC
# SecondAC.dbd will be created and installed
DBD += SecondAC.dbd

# SecondAC.dbd will be made up from these files:
SecondAC_DBD += base.dbd
SecondAC_DBD += xxxSupport.dbd
SecondAC_DBD += dbSubExample.dbd
SecondAC_DBD += SecondACHello.dbd
SecondAC_DBD += initTrace.dbd

# SecondAC_registerRecordDeviceDriver.cpp derives from SecondAC.dbd
SecondAC_SRCS += SecondAC_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
SecondAC_SRCS_DEFAULT += SecondACMain.cpp
SecondAC_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#SecondAC_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link in the code from the support library
SecondAC_LIBS += SecondACSupport

# NOTE: To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file

ifneq ($(SNCSEQ),)
    # Build sncExample into SecondACSupport
    sncExample_SNCFLAGS += +r
    SecondAC_DBD += sncExample.dbd
    SecondACSupport_SRCS += sncExample.stt
    SecondACSupport_LIBS += seq pv
    SecondAC_LIBS += seq pv

    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

# Finally link to the EPICS Base libraries
SecondAC_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

