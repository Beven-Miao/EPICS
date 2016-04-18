# Answers to Cosylab Academy EPICS Exercises


---
#Time tracker

* Module 1: Virtual Machines

Task							|	Time
------------------------------------------------------  |  -------------
Download ess VM(64bit) and SL(32bit), read manual 	|	4h30m
Complete questions					|	15m
Install ess VM(failed) and SL(updates and basic tools)	|	2h15m
**total**						|	**7h**


* Module 2: Linux

Task			|	Time
----------------------  |  ---------------
Read manual		|	20m
Complete exercises	|	1h10m
Complete questions	|	2h
Arrange Q&A		|	30m
**total**		|	**4h**


* Module 4: EPICS Introduction

Task				|	Time
------------------------------  |  --------------
Install EPICS and modules	|	2h10m
Read introductions about EPICS	|	1h
Complete questions		|	1h10m
**total**			|	**4h20m**


* Module 5: EPICS IOC

Task				|	Time
------------------------------  |  --------------
Create Example application	|	1h10m
Fix Running Errors		|	1h
Complete questions		|	2h
**total**			|	**4h10m**


* Module 6: Operator screens

Task				|	Time
------------------------------  |  -------------
Learn&create BOY Example	|	3h10m
Complete questions		|	3h
**total**			|	**6h10m**


* Module 7: EPICS databases

Task				|	Time
------------------------------  |  -------------
Read record ref and VDCT manual	|	4h
Indoor temp simulator		|	3h15m
First A/C			|	6h
Correction of assumption	|	2h
Second A/C			|	3h
Complete Q&A			|	2h
**total**			|	**21h15m**


## Module 8: Alarms, Archiver, Autosave and Restore

Task								|	Time
--------------------------------------------------------------  |  -----------
Install **ALH** and resolve dependency				|	2h
Modify, compile and run AC					|	1h
Read **ALH** document						|	1h
Config **ALH** and test						|	4h
Config **Channel Archiver** and report **XML** parse error	|	1h
Install **CASR**						|	30m
Read **CASR** document						|	15m
Config `casave` readin file					|	30m
Test save and Restore for AC					|	30m
Complete **Q&A** and time track					|	1h
**total**							|	**11h45m**

## Module 9: C subroutines

Task					|	Time
--------------------------------------- | --------------------
Read **aSub** document			|	1h
Complete **mass center** asub function	|	4h
Complete **Alarm raise** function	|	1h25m
Complete **Q&A** and Time track		|	25m
**Total**				|	**6h50m**

## Module 10: SNL

Task					|	Time
-----------------------------------	|  ------------------
Read **SNL** tutorial			|	1h
Complete **SNL** first example		|	30m
Complete **SNL AC** temple		|	5h25m
Complete **Q&A** and Time track		|	45m
**Total**				|	**7h40m**

## Module 11: EPICS device support

Task			|	Time
----------------------  |  ---------------
Read DevSup DOC 	|	2h
Complete *longin* ds	|	4h30m
Complete ds **README**	|	25m
Complete git&Time track	|	5m
**Total**		|	**7h**


## Module 12: Stream Device

Task			|	Time
----------------------	|  ----------------
Read Stream device doc	|	3h
Complete Exercise	|	6h
Q&A and time tracking	|	1h
**Total**		|	**10h**	


# Module 12: Stream Device
## 4. Questions  
1. What are serial devices?  
> Serial device sends one bit at a time, sequentially, over channel    
> to the other party. Serial communication is used for all long-haul    
> communication and most computer networks, where the cost of cable    
> and synchronization difficulties make parallel communication impractical.   

2. How can we communicate with them?  
> - Cables that carry serial data.    
> - Serial buses.

3. What is Stream Device?   
> StreamDevice is a generic EPICS device support for devices with     
> a "byte stream" based communication interface. That means devices     
> that can be controlled by sending and receiving strings (in the     
> broadest sense, including non-printable characters and even null-bytes).     
> Examples for this type of communication interface are     
> serial line (RS-232, RS-485, ...), IEEE-488 (also known as GPIB or HP-IB),     
> and telnet-like TCP/IP.

4. Which are dependencies that are needed to work with stream device?   
> Either EPICS base R3.14.6 or higher or EPICS base R3.13.7 or higher. 

5. How do we include Stream Device in EPICS application?
> Unpack the StreamDevice package in the **<top>** directory of your   
> application build area. (You might probably have done this already.)   
> Go to the newly created StreamDevice directory and run `make` (or `gmake`).

6. Describe protocol files.
> A protocol file describes the communication with one device type.   
> It contains protocols for each function of the device type and variables   
> which affect how the commands in a protocol work. It does not contain    
> information about the individual device or the used communication bus.

## 5. 5 Pass++
1. Modify the *Makefile* in application folder to enable making of application with only one command.    
> Assuming the Stream device lib location is **<top>/StreamDevice**, add following   
> command in **<top>/Makefile**:    
> `DIRS := $(DIRS) $(filter-out $(DIRS), StreamDevice)`

4. How to modify protocol to write the output to another record?
> Assuming that in protocol file `funcA` writes the output to record **A**,   
> `funcB` is called by record **B**. Then In `funcB` call `funcA`, so that  
> If record **B** is processed, it calls `funcB` and then `funcA` is called  
> by `funcB` to write the output to record **A** other than **B**.

# Module 11: EPICS device support
NULL

# Module 10: SNL
## 4. Questions
1. Which files do you need to modify in order to include SNL source into your app?
> `configure/RELEASE`, `src/Makefile` and `st.cmd`.

2. How would you check whether Sequencer was properly included into your EPICS app?
> run the Sequencer program using the `seq` command:
> `epics> seq <program name>`

3. Is it possible to use macros in SNL? How?
> Yes, macros can be used, but they are not *$(xxx)*, instead *{xxx}* is used:
> `assign mot to "{DEVICE_SLIT}MR_POSITION{SET}";`

4. What is an event flag?
> Event Flags are values of an abstract data type and act as a binary semaphore, allowing exactly one state set to continue.

5. Why would you use more than one state set in one SNL program?
> For an complex SNL program, it's better to divide it into several parts, and each state set completes its particular part of job.

6. What tools can you use in the EPICS shell to debug SNL problems?
> - `seqShow`, `seqShow <ThreadID>`
> - `seqChanShow <ThreadID>`, `seqQueueShow <ThreadID>`
> - `seqcar <level>`
> - `seqStop <ThreadID>`

7. How do you use pure C code in SNL?
> There are two C escape methods:
> 1. Any code between `%%` and the next newline character is escaped:
>  `%% for (i=0; i < NVAL; i++)`
> 2. Any code between `%{` and `}%` is escaped:
> ```
	%{
	C code Block
	}%
  ```

# Module 9: C subroutines
## 4. Questions
1. What is the difference between `sub` and `aSub` records?
> The `aSub` record is a variant of the `sub` record with **array** or **scalar** input and output fields, but the `sub` record can only use scalar input and output fields.

2. How can you find an EPICS function you need to use in your C code?
> To find an EPICS function in C code, it needs to include the appropriate header file has the declaration of this EPICS function. And you have all of the required in Application Developer manual.

# Module 8: Alarms, Archiver, Autosave and Restore
## 4.Questions
1. Why are these tools important? Provide reasons for each tool.
> - **Alarm Handler**: For safty and performance, the system is designed to raise an alarm for deviations from tolerance band, software or hardware errors and loss of communication to hardware or linked records. The ALH (Alarm Handler) bings alarms to the operator's attention; provides the operator guidance for handling of specific alarms; allows the operator to globally acknowledge alarms; provides a graphical view of current database alarms; and provides for logging alarms and display of the logged alarm history. The ALH simplifies the management of various alarms and assures the correctness of handling a specified alarm.
> - **Channel Archiver**: Channel Archiver is a toolset that can archive any data available via Channel Access. It collects only data from a given list of channels and can also be configured when to take a sample. It can store every change, it can store only changes that exceed a certain *dead band* or it can use periodic scanning. This makes it possible to limit size of the archive and store only the information required.
> - **Autosave and Restore**: The CASR can take a snapshot of the state the control system is in or to use as a starting point at a later. The main benefit of using a save and restore system is to generate different setups using different parameters values and easily switch between them. But if you save all the relevant PVs of the system youcan also stop the application and then by restoring after the re-start continue (at least in theory) where you left off.

## 5. Bonus Questions
1. Cosylab is developing CODAC which provides newer tools for monitoring alarms and archiving data. Which tools and what are their advantages?
> CSS. It is user friendly, easy to get started and well documneted.
2. What are the advantages of using "the old" tools you have just learned about?
> Lightweight, easy to config for particular purpose.

#Module 7: EPICS databases
##4. Questions
1. Which views are available in VDCT?
> - **Base view**: move to the center of the workspace and set zoom scale to 100%.
> - **Flat View**: Create some records, group them. Now look at the difference between base view and flat view. See [VDCT Manual](http://visualdct.cosylab.com/builds/VisualDCT/2.6.1274/doc/MAN-VisualDCT_Users_Manual.html).

2. How do you create a record in VDCT?
> **Right-Cliking** on the free space in **Main window**, and choose **New record** item.

3. How do you change record type in VDCT?
> VisualDCT has a capability to morph (change) record and template types, i.e. to change type and preserving all common fields. Command is accessible via **Edit** - **Morph** menu or pop-up (context) menu.

4. How do you point a link to a desired record field?
> There are two ways of linking:  
         1.  value of the **INPUT**, **OUTPUT** or **FORWARD** link field is entered using **Inspector tool**  
         2.  using linking capability of VisualDCT using only **mouse**:  
                 **Right click** on the parent record of the **INPUT**, **OUTPUT** or **FORWARD** link field  
                 Pop-up menu will appear, choose the appropriate link field  
                 A crosshair cursor will appear and the parent record will blink until the **VARIABLE** field or record if **FORWARD** link is determined; to do this, there are tree options:    
			* left click on the record - **VAR** field is used, or record if **FORWARD** link  
                        * left click on the field - link to clicked filed is created  
                        * right click on the record - pop-up menu will appear allowing you to select the **VARIABLE** field  
                 After linking is completed cursor is changed back to normal.  


5. How do you change link properties?
> Use **Inspector tool** to change link properties in link field.

6. What is the best way to enter a large number of signals?
> use templates.
> use "View" > "Spreadsheet"

7. How do you change VDCT canvas size?
> ``Shift`` + ``<-``/``->`` or use **Zoom scale slider** at the lower right corner.

8. How can you monitor PV values in VDCT?
9. What is the desired form of record names?
> Concise and meaningful.

10. What are the record fields that always need to be considered?
> **DESC**, **FLINK**, **VAL**, **SCAN**, etc.

11. When to use macros and when PVs for configuration?
> Use PVs when configuration happens in runtime, and use macros when only initialization is required.

##5. Bonus Questions
1. How do I change sine wave parameters in runtime if macros are used?
> Design a record containing the paramters' macros, then ``caput`` the corresponding PVs in runtime.

2. How to use templates in VDCT?
> Import a **db** file containing the templates via File menu, **Right Click** and choose **new template instance** in menu.

3. How do you arrange links visually?
> Check the Wires **Crossing-avoidiance** in ``View`` - ``Settings``.
> Right Click the linker or wires, add connectors, and arrange links cosier.
> Right Click the linker, and choose Move up/down properly to avoid link crossing.

4. How do you display only desired fields in VDCT?
> Each field has additional property called visibility, whether the field value is shown inside the record body (see Record representation). It can be changed by clicking right mouse button over left column. Three icons indicate the visibility state of the field: 

#Module 6: Operator screens
##4. Questions
1. Are there any guidelines that must be followed for GUI design?
> To make the screens user friendly guidelines are to be followed. At Cosylab we usually follow the [Australian synchrotron guidelines](https://internal.cosylab.com/wiki/pub/Accelerator/ModuleEpicsEDM/ASP-ICS-1009_GUI_Style_Guide_Rev1.pdf). Note: these guidelines are outdated, they were used for EDM. They will be replaced with **ESS GUI Design Guidelines** when they are ready.

2. How can I change display defaults?
>  You can change display by selectting ``Open Perspective`` in ``Window`` menu. For example, you can change the perspective to OPI Editor by ``Window -> Open Perspective -> Other ... -> OPI Editor``

3. How to snap objects to grid?
> This function can be enabled either from **Toggle Snap to Geometry** button on toolbar or from display **properties**.

4. How to align objects?
> Multiple selected widgets can be arranged in different ways with **arranging buttons** on **toolbar**. You can use these buttons to align objects.

5. How to open other screens?
> By default, Open OPI action will replace the current OPI with the new OPI. But **Ctrl-Cliking** a widget with Open OPI action attached will open the OPI in a new Tab. Or in a new window by **Shift-Cliking**. 

6. How to execute shell commands?
> 1. Select **Scripts** property in property sheet view.
> 2. In **Attach Scripts** Dialog, you can add more than one script.
> 3. **Save** and **run** the OPI to see the result.

7. How to change a display according to a PV's value or using a menu?


8. How to display alarms?
9. How to define macros?
10. How to change widget visibility according to a PV's value?
11. Which PV data is available to Boy? How to get PV data from other machines?

##5. Bonus Questions
1. How many colors are available in Boy? How can the color list be extended?
2. Is it possible to change the colors and fonts of all Boy screens? How?

---

#Module 5: EPICS IOC
##4. Questions 
1. What is the purpose of ``makeBaseApp.pl``?
> Create an example application.

2. What does a directory structure of an application look like? What is the purpose of different directories?
> All EPICS applications have the same directory structure:

              <top>/ 
                  |- configure/ 
                      |- RELEASE 
                      |- ... 
                  |- App1/ 
                      |- Db 
                      |- src 
                  |- App2/ 
                  |- dbd 
                  |- db 
                  |- lib 
                  |- bin 
                  |- iocBoot 
                  |- ...
>    * ``configure`` is a directory containing build configuration files. All required EPICS modules should be listed in the ``RELEASE`` file. 
>    * ``App1`` is the top level directory of a single EPICS application. Multiple EPICS applications can be included in a single EPICS IOC. 
>    * ``App1/Db`` here all **EPICS database** files should be located. They should also be added to the ``Makefile``. 
>    * ``App1/src`` here all **C**, **DBD** and **SNL** files should be located. The ``Makefile`` includes instructions on how to build the executable.
>    * ``dbd``, ``db``, ``lib``, ``bin`` directories are created at compile time and are the only ones used at runtime. 
>    * ``dbd`` database definition files. Here all the record fields and available functions are defined. 
>    * ``db`` database files. Here all records used by the application are included. 
>    * ``lib`` generated libraries. 
>    * ``bin`` generated executables. 
>    * ``iocBoot`` here startup configuration is defined in st.cmd.
    
3. Where do you place EPICS database files?
> ``App1/Db``

4. What are substitution files and how to use them?
> Substitution files define macros to allow different configuration of the same database. Macros are denoted with ``$(macro_name)``, e.g. ``$(DEVICE)``.
> Substitution files can use two formats, namely the regular or the pattern format. At Cosylab the pattern format is usually used.
> In the examples bellow both files load the template.db file 4 times with different macro assignment.

	> * *Regular format* :
    
              file "${WHERE}/template2" { 
                  {var1=set1_val1, var2=set1_val2, ...}
                  {var2=set2_val2, var1=set2_val1, ...} 
                  {var1=set3_val1, var2=set3_val2, ...} 
                  {var2=set4_val2, var1=set4_val1, ...} 
              }
	> * *Pattern format*
    
              file "${WHERE}/template2" { 
                  pattern {var1, var2, ...} 
                  {set1_val1, set1_val2, ...} 
                  {set2_val1, set2_val2, ...} 
              }
    

5. How do you include EPICS modules?
> All required EPICS modules should be listed in the ``configure/RELEASE`` file.

6. How do you include C code?
> C code should be placed in ``App1/src`` directory, and ``Makefile`` needs to be modified to include this information.

7. Which directories are required at runtime?
> ``dbd``, ``db``, ``lib``, ``bin`` directories are created at compile time and are the only ones used at runtime.

8. How do you build an EPICS application? 
> In directory ``<top>`` execute the command
    
		make
    
    
9. What is the location of ``st.cmd`` and how do you run an IOC application? 
> ``<top>/iocBoot/iocmyexample`` contains ``st.cmd``
> Run an IOC application:
    
		cd <top>/iocBoot/iocmyexample
		../../bin/linux-x86/myexample st.cmd
    
10. What is the difference between ``/db`` and ``/<App.name>App/Db`` directories? 
> ``/<App.name>App/Db`` is copied from ``/db`` during compiling time.

11. What happens if you make changes directly in the ``db`` directory? Do you need to compile the application for the changes to take affect?
> It affects all the application compiled from it afterwards.
> Yes, you have to recompile it to take the changes affect.

12. How do you get a list of all ``ai`` records in an application with descriptions?
> ``dbl("ai")``

13. How can you read the time when the record was last processed?
14. How can you read array PVs, how can you set their values?
15. How can you determine the machine where a specific record is available?

16. What is the VDCT debug plugin?
> VDCT is a graphical tool used to do EPICS database development, which makes databases easier to read and work much simpler, not to mention less error prone.

17. What types of record scanning are possible?
> There are three scanning methods for database records: (1) *periodic*, (2) *event*, and (3) *passive*.

18. How do you import custom ``dbd`` files in **VDCT**?
> Use Manage DBDs in File Menu to load the custom dbd files.

19. What is the difference between ``db`` and ``dbd`` files?
> * ``dbd`` database definition files. Here all the record fields and available functions are defined. 
> * ``db`` database files. Here all records used by the application are included. 

20. What are links and what is the difference between various types of links?
> The records in the process database use **link fields** to configure *data passing and scheduling (or processing)*. These fields are either **INLINK**, **OUTLINK**, or **FWDLINK** fields.
> * **Forward Links**
If the record that is referenced by the FLNK field has a SCAN field of Passive, then the record is processed after the record with the FLNK. The FLNK field only causes record processing, no data is passed.
> * **Input Links**
Input links normally fetch data from one field into a field in the referring record.
> * **Output Links**
Output links normally provide data in a field in the referring record.

21. Explain the difference between setups on the following pictures?
> In Figure 1, three records are shown. The ai record "Input" is processed periodically. At each interval, Input is processed. After Input has read the new input, converted it to engineering units, checked the alarm condition, and posted monitors to Channel Access, then the calc record "Calculation" is processed. Calculation reads the input, performs the calculation, checked the alarm condition, and posted monitors to Channel Access, then the ao record "Output" is processed. Output reads the desired output, rate limits it, clamps the range, calls the device support for the OUT field, checks alarms, posts monitors and then is complete.
> In Figure 2, the *PP attribute* is used. In this example, Output is processed periodically. Record processing first fetching the DOL field. As the DOL field has the PP attribute set, before the VAL field of Calc is returned, the record is processed. The first thing done by the ai record Input does is to read the input. It then converts the RVAL field to engineering units and places this in the VAL field, checks alarms, posts monitors, and then returns. The calc record then fetches the VAL field field from Input, places it in the A field, computes the calculation, checks alarms, posts monitors, the returns. The ao record, Output, then fetches the VAL field from the CALC record, applies rate of change and limits, write the new value, checks alarms, posts monitors and completes.

---
#Module 4: EPICS Introduction    
##4. Questions
1. What is "tech-talk"?
> The EPICS mailing list is called *tech-talk*, and is used for technical discussions, questions and announcements.

2. Where can I find everything related to EPICS?
> http://www.aps.anl.gov/epics/

3. What is the difference between a PV and a record?
> A record name and field name combined give a name of a 
process variable (PV).

4. Each record has many PVs. What is the default PV associated with a record?
> The default PV will use the **.VAL** field of a record. 

5. What happens to record fields when the record processes?
> They do one or several things below depending upon the record type and the values in its fields:
- Get data from other records or from hardware
- Perform calculations
- Check values are in range and raise alarms
- Put data to other records or to hardware
- Activate or disable other records
- Wait for hardware signals (interrupts)

6. What does the EPICS logo symbolize?
> The EPICS logo symbolizes the EPICS which consists of Client Application, Channel Access and IOC/server Application.

7. What do you call the entity that reads or writes to a PV from a remote machine?
> Channel Access.

8. Name a few shell commands that use "Channel Access".
> * caget
> * caput
> * camonitor
> * cainfo

9. Which of the following hosts PVs, CA server or CA client?
> CA server.

10. What are CA servers called in EPICS?
> IOC (Input Output Control).

11. Name a few CA clients.
> * MEDM
> * EDM
> * CSS-BOY
> * StripTool
> * ALH
> * CSS-BEAST

12. What is the difference between an EPICS application and an IOC?
> An IOC is the server application, so it is a part of EPICS application.

****

#Module 2: Linux
##4.Questions
###4.1. Linux Shell and file permissions

1. Name commands used for copying, moving and deleting files, changing and making newdirectories.
> ``cp``, ``mv``, ``rm``, ``cd``, ``mkdir``

2. If your current directory is ``/home/user/livingroom/``, what is the absolute path of ``../../bakery/``?
> ``/home/bakery/``

3. Which directory does ``~`` refer to?
> The current user's home directory.

4. Which directory contains system settings?
> ``/etc/``

5. What is autocomplete?
> It predicts a word or phrase that the user wants to type in without the user actually typing it in completely. In a **linux** terminal, one can use ``TAB`` to autocomplete a command or a directory.

6. How do you run an executable file in the current directory?
> ``./executablefile``

7. Why and how would you use output redirection?
> When one wants to dump the output information into a file, especially when the result has too many lines too show in a screen.
> ``>`` or ``>>`` for stardard output and ``2>`` or ``2>>`` for error output.

8. How would you execute a command within a command?
> Commands can be nested using the `` ` `` special character. To list all file under a directory named **test** under current directory, the nested command: `` $ ls `find -type d -name test` `` can be used.

9. What is the purpose of the super user (root)?
> **root** is the *god* in the linux system who creates and rescues all other users.

10. What is a shebang and what do we use it for?
> A shebang stands for ``#!``. It is put at the beginning of a script and calls the specified interpreter to parse this script.

11. You are user mkobal, member of the group godlike. What permissions do you have on the fileslisted below? Why?

        -rwxr--r-- root    root       290 Jan 26 14:08 compressed.gz r
        -rwxr-xr-- unixguy godlike 331836 Jan 26 14:06 frozenBubble  r&x
        drwxrwxr-x unixguy staff       48 Jan 26 11:28 parties       r
        -rwxrwx--x mkobal  godlike     29 Jan 26 14:03 executable    r,w&x

12. What is a software package? Name a few package managers.
>A software package is a software that has been built from source with one of the available package management systems.
``yum/rmp`` and ``apt/dpkg`` are common used package managers.

##4.2. Networking 
1. Is the computer with the IP ``10.5.2.1``, netmask ``255.255.255.0`` connectable to the IP ``10.5.3.8``? Why? What would happen if the netmask on both computers was ``255.255.252.0``?
> Unconnectable. Because this computer is in a network segment which IP varies in ``10.5.2.X``, so it can't reach the IP ``10.5.3.8``.
When the netmask on both computers was ``255.255.252.0``, then the IP ``10.5.2.X`` and ``10.5.3.X`` are belong to the same network segment, so it is connectable.

2. What is a TCP/IP port? How many ports are there?
> * The port does the job of transporting and managing the data across the network is called TCP/IP port which stands for Transmission Control Protocol (TCP) and Internet Protocol (IP).
> * Port numbers are straight unsigned integer values which range up to a value of 65535.

3. What is NAT? What is a firewall? How do they relate?
> NAT standing for Network Address Translation is the process where a network device, usually a firewall, assigns a public address to a computer (or group of computers) inside a private network.
A firewall is a technological barrier designed to prevent unauthorized or unwanted communications between computer networks or hosts.
They work together to make a cluster of computers inside a private network work and work safer.


4. Why and how would you use SSH port tunneling?
> Because SSH tunneling allows us to access an otherwise inaccessible computer on the internal network from another computer on that network that is running SSH server and can be accessed from the outside network. Besides, SSH provides secure encrypted communications between two untrusted hosts over an insecure network, so it is more secure to use SSH port tunneling.
To establish the SSH tunnel from remote host port 80 to your local port 7000, execute the following: 
`` $ ssh -L 7000:<inaccessibleHost>:80 user@<accessibleHost> ``

5. Is ``www.example.com`` always the same as ``example.com``? What's the difference to ``http://www.example.com``?
>  No, it depends on the Domain DNS.
It will use ``http`` protocol to transport the data in this website.

##4.3. Software installation
1. Name a few package managers.
> ``yum/rmp ``， ``apt/dpkg``

2. Which commands do you need to run to compile and install a downloaded source archive file(.tar.gz)?

		$ tar xzvf software.tar.gz 
		$ cd software 
		$ ./configure 
		$ make
		# make install


3. Which file do you usually need to modify before compiling EPICS software?
> ``./configure/RELEASE``

4. What do you do when something goes wrong and compilation fails?
> Check out where the first error occurs, find the solution to it， find other independent fails in sequence and then compile it again. If it still goes wrong, check and fix it again. If something apperantly makes no sense, then look into the makefile and even the source code of the software. 

5. What went wrong during the compilation below?
> ``re2c`` command is not found:        
    
		re2c -o lexer.c ../snl.re 
		make[3]: re2c: Command not found 
    

****
	
#Module 1: Virtual Machines
##4. Questions
1. Why do we use virtualization and remote connections?
> Because it can save time for installing system and configuring it.

2. Why should you install virtual machine locally?
> Because you can develop and test the software locally, especially when your PC is offline.
	
3. How can you remotely connect to a Linux or Windows machine?	
> You can remotely connect to it by **SSH** or **TELNET** through some tools like SecureCRT or PuTTY.
	For Windows, you can also use the ``mstsc`` command to remotely connect to the Remote Desktop window.

4. There’s a small issue with all virtualizations and remote connections. What is it?
> The software running inside the virtual machine or remote machine is limited to the resources and abstractions provided by the virtual/remote machine — it cannot break out of its virtual world.
	

##5. Bonus Questions
1. Is a virtual machine any different from a physical machine?
> The performance is different. The performance of a virtual machine is constrained by its host machine, while that of a physical machine is directly subject to the hardware.
	It is worth noting when you test a software in a virtual machine while run it on a physical machine.

2. Is it possible to access host directories?
> Yes, one can setting the shared folders for the virtual machine to access host directories after installing the Guest Additions if using VirtualBox or VmWare Tools if using VmWare Player.

3. What type of network interfaces are available in the virtual machine?
> * NAT 
> * Brigded Adapter 
> * Host-only Adapter
