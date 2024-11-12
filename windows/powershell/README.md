
Setup new Windows Computer
```
# remove folder redirection to OneDrive (Documents, Pictures, etc)
* OneDrive -> Settings -> Sync And Backup -> Manage backup -> deactivate Documents, Pictures, Desktop
* restart OneDrive

# Migrate from Windows PowerShell 5.1 to PowerShell 7
* source: https://aka.ms/PSWindows

# install Windows Terminal
* https://github.com/microsoft/terminal

# configure Windows Terminal
* Settings -> Default Profile: PowerShell

# optional: change PowerShell Execution Policy from Restricted to Unrestricted
* open PowerShell in Elevated Mode (run as Administrator)
Set-ExecutionPolicy -ExecutionPolicy Unrestricted

# startup script (source file)
* create profile file: C:\Users\{username}\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
```


Find out the current path to the powershell profile
```
$profile
```
my current path: C:\Users\florianb\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1


