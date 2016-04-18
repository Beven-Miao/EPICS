#Note on stream device application

## Setup
1. **AsynDriver** configuration and other supports such as **sCalc**, **RE** and PCRE.    
    Add the module locations to the `configure/RELEASE`:    
    ```
    ASYN=/opt/codac-4.1/epics/modules/asyn
    ```

2. Download and unzip [StreamDevice](http://epics.web.psi.ch/software/streamdevice/StreamDevice-2.tgz)   

3. Add StreamDevice Library directory to `<top>/Makefile`  
    ```
    DIRS := $(DIRS) $(filter-out $(DIRS), StreamDevice)
    ```

4. Add *asyn* and *stream* libraries in app `src\Makefile`:   
    ```
    PROD_LIBS += stream
    PROD_LIBS += asyn
    ```

5. Change directory to `<top>` and `make`

6. Include the following lines in `src\sdAppInclude.dbd`:    
    ```
    include "base.dbd"    
    include "stream.dbd"    
    include "asyn.dbd"    
    registrar(drvAsynIPPortRegisterCommands)    
    registrar(drvAsynSerialPortRegisterCommands)    
    registrar(vxi11RegisterCommands)    
    ```    
    and include it in `Makefile`    
    ```
    sd_DBD += sdAppInclude.dbd
    ```


7. Configure the startup script `st.cmd`:    
    Set th environment variable `STREAM_PROTOCOL_PATH` to a directories of protocol files.     
    ```
    putenv ("STREAM_PROTOCOL_PATH=.:../protocols")   
    ```

    Configure the buses or asyn ports with *StreamDevice*, e.g.   
    ```  
    drvAsynSerialPortConfigure ("PS1","/dev/ttyS1")   
    asynSetOption ("PS1", 0, "baud", "9600")      
    asynSetOption ("PS1", 0, "bits", "8")    
    asynSetOption ("PS1", 0, "parity", "none")    
    asynSetOption ("PS1", 0, "stop", "1")   
    ```

8. The protocal file example `ExamplePS.proto`:    
    ```
    Terminator = CR LF;   
    setCurrent {   
        out "CURRENT %.2f";   
        @init {  
            out "CURRENT?";   
            in "CURRENT %f A";  
        }  
    }  
    ```

9. Configure the Records:   
    set **DTYP** to *stream*   
    set **INP/OUT** link in the form:    
    `@proto.filename proto_entry(args) $(Asyn_port) address`   
    for example:    
    ```
    field (DTYP, "stream")    
    field (OUT, "@ExamplePS.proto setCurrent PS1")
    ```


## Device Simulator    
1. Download and unzip the [Device Simulator](https://internal.cosylab.com/wiki/pub/Accelerator/ModuleEpicsStreamDevice/DeviceSimulator.zip).    
    ```
    wget https://internal.cosylab.com/wiki/pub/Accelerator/ModuleEpicsStreamDevice/DeviceSimulator.zip        
    unzip DeviceSimulator.zip        
    ```

2. Running Device Simulator    
    ```
    java -cp jars/JansaTrivialMPS/Simulator.jar com.cosylab.devicesimulator.Communicator xml/knock.xml
    ```

3. Testing    
    Prerequisites: netcat, telnet.    
    ```
    nc -C localhost 7055    
    ```    
    Then type in `knock` or `time`.    


## Setup Stream device support for Device Simulator
1. run Device Simulator as above.

2. Create **stringin** record for simulated "knock" device.    
    Add **dbStreamDevice.db** in *sd/sdApp/Db*:     
    ```
    record(stringin, "sd")    
    {    
        field(DTYP, "stream")    
        field(SCAN, "5 second")    
        field(INP, "@sd.proto getTime PS0")    
    }    
    ```    
    Modify *Makefile*:    
    `DB += dbStreamDevice.db`    

3. Prepare protocal file    
    Add *sd.proto*:    
    ```    
    getTime{    
        out "time\r\n";    
        in "%s";    
    }    
    ```    
    **Warning**: There are error messages in parsing the time returned.    
    ```    
    epics>    
    2015/07/13 14:29:26.630480 PS0 sd: 10 bytes surplus input " 14:29:26<0a>"    
    2015/07/13 14:29:26.630544 PS0 sd: after 10 bytes: "2015-07-13"    
    ```    

4. Configure the Startup script `st.cmd`    
    Include the **protocal** file:      
    `epicsEnvSet ("STREAM_PROTOCOL_PATH", ".:./protocols")`    
    Load the **stringin** record:    
    `dbLoadRecords "db/dbStreamDevice.db"`    
    Configure the **AsynDrv** for simulated device:    
    `drvAsynIPPortConfigure ("PS0","localhost:7055")`    

5. run *ioc*   
    `./st.cmd`

6. Testing:    
    Open another terminal and invoke:    
    `camonitor sd.VAL`    
