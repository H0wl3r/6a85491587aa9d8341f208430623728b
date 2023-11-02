Steps to install Sysmon via GPO.

** IMPORTANT **  
:: 1) Create a Sysmon folder with the SYSVOL share on your domain controller  (utalise fsmgmt.msc on DC)  
:: 2) place sysmon64.exe, sysmonConfig.xml and sysmon_install.bat in newly created Sysmon folder  
:: 3) Create a GPO that will launch this batch file on startup.  
:: 4) Apply the GPO to your specified OUs.   

----- 1 - Software Distribution Point-----  
Login to the DC and create a folder at “C:\Software_Distribution_Point“. Right-click the “C:\Software_Distribution_Point” folder and create a new share.  
“Sharing” tab “Advanced Sharing“.  
“Share This Folder” box and name the share “sdp$“. The “$” at the end will hide the share. Fill in the comment so others know what this share is for.  
“Permissions” button With the “Everyone” group selected, click the “Full Control” check box. Share Permissions are weak, so we will later use “Security Permissions” to really secure the files.  
Click “ok“.  
  
Right-click the “C:\Software_Distribution_Point” folder and create the Security Permissions.  
“Security” tab. “Advanced“.   
“Disable inheritance“ Confirm by clicking “Convert inherited permissions into explicit permissions on this object“  
Now remove any other user’s accounts listed, then add “Domain Users“, and “Domain Computer” with ONLY “Read” permission. Then add “Domain Admins” with “Full Control” permissions.  
Click “OK“  
Click “Close“  
  
----- 3 - Create a Deployment Group Policy -----  
Login to your Domain Controler, open Group Policy editor, create a new Group Policy Object(GPO), and name it “Sysmon_Deployment“.  
Find the new GPO, right-click on it and click “Edit“.  
navigate to the following “Computer Configuration –> Policies –> Windows Settings –> Scripts (Startup/Shutdown)“  
Right-click on “Startup” and click on “Properties“.  
In the “Startup Properties” windows, click “Add“.  
In the “Edit Script” windows click “Browse…“  
In the popup explorer window, navigate to the SDP share; Select the Sysmon install Batch script we made earlier.  
Click “Open“ we don’t need to add any script parameters, so click “Ok”.  
Click “Ok” to complete the changes to the Startup script settings.  


