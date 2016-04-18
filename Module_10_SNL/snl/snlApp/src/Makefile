TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#=============================
# Build the IOC support library

LIBRARY_IOC += snlSupport

# xxxRecord.h will be created from xxxRecord.dbd
DBDINC += xxxRecord
# Install devXxxSoft.dbd into <top>/dbd
DBD += xxxSupport.dbd

# Compile and add the code to the support library
snlSupport_SRCS += xxxRecord.c
snlSupport_SRCS += devXxxSoft.c

# Link locally-provided code into the support library,
# rather than directly into the IOC application.
snlSupport_SRCS += dbSubExample.c
snlSupport_SRCS += snlHello.c
snlSupport_SRCS += initTrace.c

snlSupport_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
# Build the IOC application

PROD_IOC = snl
# snl.dbd will be created and installed
DBD += snl.dbd

# snl.dbd will be made up from these files:
snl_DBD += base.dbd
snl_DBD += xxxSupport.dbd
snl_DBD += dbSubExample.dbd
snl_DBD += snlHello.dbd
snl_DBD += initTrace.dbd

# snl_registerRecordDeviceDriver.cpp derives from snl.dbd
snl_SRCS += snl_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
snl_SRCS_DEFAULT += snlMain.cpp
snl_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#snl_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link in the code from the support library
snl_LIBS += snlSupport

# NOTE: To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file

ifneq ($(SNCSEQ),)
    # Build sncExample into snlSupport
    sncExample_SNCFLAGS += +r
    snl_DBD += sncExample.dbd
    snlSupport_SRCS += sncExample.stt
    snlSupport_LIBS += seq pv
    snl_LIBS += seq pv

    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

# Finally link to the EPICS Base libraries
snl_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

