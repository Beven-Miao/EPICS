# README
## dbAirCondSys.db
There are three ``calc`` records in *dbAirCondSys.db*:     
**calcTime**, **calcOutDoorTmp/odt** and **calcInDoorTmp/idt**.      
    
The **calcTime** simulates 24 hours in one day, increasing one hour per second by *SCAN*.      
    
The **odt** is outdoor temperature simulator.     
It reads ``$(HighTmp)`` for the default highest temperature     
and ``$(LowTmp)`` for the default lowest temperature in a day.     
And then it reads the current time from the **calcTime** record      
and generates the corresponding temperature by a **sine wave**      
with highest and lowest temperature into consideration.      
      
The **idt** is indoor temperature simulator which changes due to      
the **odt** considering the insulation coefficient.       
Realistically, if the **odt** is lower than a base temperature,       
the room temperature will be higher because of insulation and vice versa.       
The default ``$(BaseTmp)`` and ``$(InsulCoeff)`` are loaded with macros.     

## ACSys.substitutions
In this file the corresponding device and default macros are defined.
