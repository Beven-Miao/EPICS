# casave and carestore

## Install  
The **casave** and **carestore** are not available in the Cosylab VM, so the [CASR](http://www.aps.anl.gov/epics/extensions/casr/) extension should be installed firstly. Because by default the CASR is depedent on the [SDDS](http://www.aps.anl.gov/Accelerator_Systems_Division/Accelerator_Operations_Physics/oagPackages.shtml) extension and to download the SDDS needs download key, so it is preferred to modify the *Makefile* of CASR to set the I_WANT_SDDS option to NO.   

After Installation, you can set the *path* for CASR by

	cp -s /opt/codac-4.1/epics/extensions/bin/linux-x86_64/casave /etc/alternatives/codac-usr-casave
	cp -s /etc/alternatives/codac-usr-casave /usr/bin/casave
	cp -s /opt/codac-4.1/epics/extensions/bin/linux-x86_64/carestore /etc/alternatives/codac-usr-carestore
	cp -s /etc/alternatives/codac-usr-carestore /usr/bin/carestore

## Run the AC application

## Creat **request** file  
A request file named *in* is created as   

```	
data {
        ac:idt
        ac:odt
        ac:power
        ac:aiMode
        ac:aiPower
}
```

## Autosave

	casave -asciiin in -asciiout ac_snapshot

This comandline reads in PV names of the AC system from file *in*, and save the current PV values to file *ac_snapshot*, as follows

```
env{
Logonid{"codac-dev (CODAC Core System Developer)"}
SnapType{Absolute}
TimeStamp{"Tue Jun 30 02:58:31 2015 "}
Time{1435625911}
LocalDTime{025831}
LocalJDate{15181}
GmtDTime{005831}
GmtJDate{15181}
InputFile{"/home/codac-dev/EPICS_Academy/Module_8_Alarms_Archiver_Autosave_and_Restore/3_Autosave_and_Restore/in"}
}
data{
  ac:idt{value{data{44.2837682822645}} sevr{MAJOR} stat{HIHI}}
  ac:odt{value{data{42.0296752830706}} sevr{MAJOR} stat{HIHI}}
  ac:power{value{data{0.4}} sevr{NO_ALARM}}
  ac:aiMode{value{data{0}} sevr{NO_ALARM}}
  ac:aiPower{value{data{0.4}} sevr{NO_ALARM}}
}
```


## Change and Restore
Change the ac:Mode value to 2 to set AC into auto mode and change the ac:aiPower to 0 to enable variable power.  
```
  ac:aiMode{value{data{2}} sevr{NO_ALARM}}
  ac:aiPower{value{data{0}} sevr{NO_ALARM}}
```

Then restore the system by the following comands:
```
carestore -asciiin ac_snapshot
```

You can use camonitor to monitor the change of the PVs value:
```
[codac-dev@localhost db]$ camonitor ac:aiMode
ac:aiMode                      2015-06-30 03:00:10.574256 0
ac:aiMode                      2015-06-30 03:03:02.334567 2
```
