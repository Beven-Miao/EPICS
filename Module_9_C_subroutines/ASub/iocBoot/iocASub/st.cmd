#!../../bin/linux-x86_64/ASub

## You may have to change ASub to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/ASub.dbd"
ASub_registerRecordDeviceDriver pdbbase

## Load record instances
## dbLoadTemplate "db/userHost.substitutions"
## dbLoadRecords "db/dbSubExample.db", "user=codac-devHost"
dbLoadRecords "db/dbaSub.db"

## Set this to see messages from mySub
#var mySubDebug 1

## Run this to trace the stages of iocInit
#traceIocInit

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncExample, "user=codac-devHost"
