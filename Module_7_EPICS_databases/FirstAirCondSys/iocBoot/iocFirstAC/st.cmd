#!../../bin/linux-x86_64/FirstAC

## You may have to change FirstAC to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/FirstAC.dbd"
FirstAC_registerRecordDeviceDriver pdbbase

## Load record instances
#dbLoadTemplate "db/userHost.substitutions"
dbLoadTemplate "db/ACSys.substitutions"
#dbLoadRecords "db/dbSubExample.db", "user=codac-devHost"

## Set this to see messages from mySub
#var mySubDebug 1

## Run this to trace the stages of iocInit
#traceIocInit

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncExample, "user=codac-devHost"
