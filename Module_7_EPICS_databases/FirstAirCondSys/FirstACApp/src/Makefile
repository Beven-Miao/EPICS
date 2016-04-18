TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#=============================
# Build the IOC support library

LIBRARY_IOC += FirstACSupport

# xxxRecord.h will be created from xxxRecord.dbd
DBDINC += xxxRecord
# Install devXxxSoft.dbd into <top>/dbd
DBD += xxxSupport.dbd

# Compile and add the code to the support library
FirstACSupport_SRCS += xxxRecord.c
FirstACSupport_SRCS += devXxxSoft.c

# Link locally-provided code into the support library,
# rather than directly into the IOC application.
FirstACSupport_SRCS += dbSubExample.c
FirstACSupport_SRCS += FirstACHello.c
FirstACSupport_SRCS += initTrace.c

FirstACSupport_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
# Build the IOC application

PROD_IOC = FirstAC
# FirstAC.dbd will be created and installed
DBD += FirstAC.dbd

# FirstAC.dbd will be made up from these files:
FirstAC_DBD += base.dbd
FirstAC_DBD += xxxSupport.dbd
FirstAC_DBD += dbSubExample.dbd
FirstAC_DBD += FirstACHello.dbd
FirstAC_DBD += initTrace.dbd

# FirstAC_registerRecordDeviceDriver.cpp derives from FirstAC.dbd
FirstAC_SRCS += FirstAC_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
FirstAC_SRCS_DEFAULT += FirstACMain.cpp
FirstAC_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#FirstAC_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link in the code from the support library
FirstAC_LIBS += FirstACSupport

# NOTE: To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file

ifneq ($(SNCSEQ),)
    # Build sncExample into FirstACSupport
    sncExample_SNCFLAGS += +r
    FirstAC_DBD += sncExample.dbd
    FirstACSupport_SRCS += sncExample.stt
    FirstACSupport_LIBS += seq pv
    FirstAC_LIBS += seq pv

    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

# Finally link to the EPICS Base libraries
FirstAC_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

