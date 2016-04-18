TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#=============================
# Build the IOC support library

LIBRARY_IOC += ASubSupport

# xxxRecord.h will be created from xxxRecord.dbd
DBDINC += xxxRecord
# Install devXxxSoft.dbd into <top>/dbd
DBD += xxxSupport.dbd

# Compile and add the code to the support library
ASubSupport_SRCS += xxxRecord.c
ASubSupport_SRCS += devXxxSoft.c

# Link locally-provided code into the support library,
# rather than directly into the IOC application.
ASubSupport_SRCS += dbSubExample.c
ASubSupport_SRCS += ASubHello.c
ASubSupport_SRCS += initTrace.c

ASubSupport_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
# Build the IOC application

PROD_IOC = ASub
# ASub.dbd will be created and installed
DBD += ASub.dbd

# ASub.dbd will be made up from these files:
ASub_DBD += base.dbd
ASub_DBD += xxxSupport.dbd
ASub_DBD += dbSubExample.dbd
ASub_DBD += ASubHello.dbd
ASub_DBD += initTrace.dbd
ASub_DBD += dbaSub.dbd


# ASub_registerRecordDeviceDriver.cpp derives from ASub.dbd
ASub_SRCS += ASub_registerRecordDeviceDriver.cpp
ASub_SRCS += dbaSub.c

# Build the main IOC entry point on workstation OSs.
ASub_SRCS_DEFAULT += ASubMain.cpp
ASub_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#ASub_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link in the code from the support library
ASub_LIBS += ASubSupport

# NOTE: To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file

ifneq ($(SNCSEQ),)
    # Build sncExample into ASubSupport
    sncExample_SNCFLAGS += +r
    ASub_DBD += sncExample.dbd
    ASubSupport_SRCS += sncExample.stt
    ASubSupport_LIBS += seq pv
    ASub_LIBS += seq pv

    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

# Finally link to the EPICS Base libraries
ASub_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

