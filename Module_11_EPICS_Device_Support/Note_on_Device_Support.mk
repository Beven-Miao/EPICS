# Note on Device Support

## Concepts
- What is device support?
> Device support allows new device types without impacting the core IOC system.  
> A device support module consists of a standard set of device support routines.  
> The *process* routine calls device support routines to perform I/O.  
> Device support routines are located via a Device Support Entry Table (DSET).  
> The purpose of device support is to hide hardware specific details from record processing routines.   
> The device support routines are the interface between hardware specific fields in a database   
> and device drivers or the hardware itself.  

- Database common contains two device related fields:
> - **dtyp**: Device Type, the index defined by the device ASCII definitions.  
> - **dset**: Address of Device Support Entry Table, initialized by the *iocInit* with *dtype* and *devSup.h*.   

- Two basic device support module classes:
> - synchronous: e.g. register based devices with a delay of less than a few microseconds.   
> - asynchronous: e.g GPIB devices with delays of greater than 100 microseconds.  
> If a device takes a long time to accept requests, a driver can be created that periodically polls all its   
> attached input devices.  

- Device Support Routines
> report   
> init   
> init_record   
> get_ioinit_info   
> Other: record types specific.   

