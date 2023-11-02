Steps to install Sysmon via GPO.

** IMPORTANT **  
:: 1) Create a Sysmon folder with the SYSVOL share on your domain controller  
:: 2) Download Sysmon from Microsoft and place both sysmon.exe and sysmon64.exe in newly created Sysmon folder  
:: 3) Download a sample sysmon config from SwiftOnSecurity, rename the file to sysmonConfig.xml and place it within the Sysmon folder  
:: 4) Enter the appropriate values for your DC and FQDN below.  
:: 5) Create a GPO that will launch this batch file on startup.  
:: 6) Apply the GPO to your specified OUs.   

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

