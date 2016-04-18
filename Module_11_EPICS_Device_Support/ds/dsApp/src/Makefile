TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#=============================
# Build the IOC support library

LIBRARY_IOC += dsSupport

# xxxRecord.h will be created from xxxRecord.dbd
DBDINC += xxxRecord
# Install devXxxSoft.dbd into <top>/dbd
DBD += xxxSupport.dbd


# Compile and add the code to the support library
dsSupport_SRCS += xxxRecord.c
dsSupport_SRCS += devXxxSoft.c

# Link locally-provided code into the support library,
# rather than directly into the IOC application.
dsSupport_SRCS += dbSubExample.c
dsSupport_SRCS += dsHello.c
dsSupport_SRCS += initTrace.c

dsSupport_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
# Build the IOC application

PROD_IOC = ds
# ds.dbd will be created and installed
DBD += ds.dbd

# ds.dbd will be made up from these files:
ds_DBD += base.dbd
ds_DBD += xxxSupport.dbd
ds_DBD += dbSubExample.dbd
ds_DBD += dsHello.dbd
ds_DBD += initTrace.dbd
ds_DBD += longinSupport.dbd

# ds_registerRecordDeviceDriver.cpp derives from ds.dbd
ds_SRCS += ds_registerRecordDeviceDriver.cpp
ds_SRCS += devLongin.c

# Build the main IOC entry point on workstation OSs.
ds_SRCS_DEFAULT += dsMain.cpp
ds_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#ds_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link in the code from the support library
ds_LIBS += dsSupport

# NOTE: To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file

ifneq ($(SNCSEQ),)
    # Build sncExample into dsSupport
    sncExample_SNCFLAGS += +r
    ds_DBD += sncExample.dbd
    dsSupport_SRCS += sncExample.stt
    dsSupport_LIBS += seq pv
    ds_LIBS += seq pv

    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

# Finally link to the EPICS Base libraries
ds_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

