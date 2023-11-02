@echo off

:: - Variables 
set DC=vmware-host
set SHARE=Shared Folders\vmshare\sysmon

:: [-] Check if running as an Admin
net.exe session 1>NUL 2>NUL || (Echo This script requires elevated rights. & Exit /b 1)

:: [-] Check to see if sysmon is running
sc query "Sysmon64" | Find "RUNNING" 2>NUL
If "%ERRORLEVEL%" EQU "1" (
goto startsysmon 
) else  echo [-] Service already Running
( exit 0 )

:: [-] Check if SysMon is installed, if not install it.
:startsysmon
net start Sysmon64 2>NUL
If "%ERRORLEVEL%" EQU "1" (
goto installsysmon
)

:: [-] Install the sysmon agent
:installsysmon
"\\%DC%\%SHARE%\sysmon64.exe" /accepteula -i "\\%DC%\%SHARE%\sysmonconfig.xml"
If "%ERRORLEVEL%" EQU "1" (
echo [-] An Error occured while loading the SysMon Config.
)
exit 0