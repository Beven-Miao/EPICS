# Example of EPICS Device Support
(Lixiang Yin, Jul.9.2015)
----------------------------
## Description
    This is a revised device support for *longin* so that it reads the system time in seconds.   
    This EPICS device support provides the "second" part (00-59) of the system realtime clock.   
    This EPCIS record database provides tow records, with 1 second and 5 second SCAN field, respectively.

## Building
    - EPICS app template setup:
    ```
    mkdir ds
    makeBaseApp.pl -t example ds
    makeBaseApp.pl -i -t exmaple ds
    ```   

    - Prepare following files:  
    `ds/dsApp/src/devLongin.c`  
    `ds/dsApp/src/longinSupport.dbd`    
    `ds/dsApp/Db/dbLongin.db`  

    - Modify following files:
    `ds/dsApp/src/Makefile`    
    `ds/dsApp/Db/Makefile`
    `ds/iocBoot/iocds/st.cmd`   

    - invoke the `make` command in *ds* to compile the application
    `make`  

# Running
    Use following commands to run the application:
    ```
    cd iocBoot/iocds/  
    chmod +x st.cmd
    ./st.cmd
    ```

# Testing
    Testing in another terminal:
    ```
    camonitor li_1s
    camonitor li_5s
    ```    


