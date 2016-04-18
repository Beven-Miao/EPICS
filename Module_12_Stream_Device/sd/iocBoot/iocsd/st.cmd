#!../../bin/linux-x86_64/sd

## You may have to change sd to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/sd.dbd"
sd_registerRecordDeviceDriver pdbbase

epicsEnvSet ("STREAM_PROTOCOL_PATH", ".:./protocols")

epicsEnvShow ("STREAM_PROTOCOL_PATH")

## Load record instances
dbLoadTemplate "db/userHost.substitutions"
dbLoadRecords "db/dbSubExample.db", "user=codac-devHost"
dbLoadRecords "db/dbStreamDevice.db"

drvAsynIPPortConfigure ("PS0","localhost:7055")

## Set this to see messages from mySub
#var mySubDebug 1

## Run this to trace the stages of iocInit
#traceIocInit

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncExample, "user=codac-devHost"
