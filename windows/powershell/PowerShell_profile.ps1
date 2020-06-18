
#
# helper functions
#

Function EditHostsFile {
	C:\"Program Files"\Notepad++\notepad++.exe c:\Windows\System32\Drivers\etc\hosts
}


#
# aliases
#

Set-Alias -Name k -Value C:\ProgramData\chocolatey\bin\kubectl.exe
Set-Alias -Name f -Value C:\ProgramData\chocolatey\bin\fluxctl.exe
Set-Alias -Name edit -Value "C:\Program Files\Notepad++\notepad++.exe"
New-Alias which get-command
Set-Alias -Name hosts -Value EditHostsFile


#
# done
#	


Write-Host "Custom PowerShell Environment Loaded, please edit me at:"
Write-Host "C:\Users\flori\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
Write-Host ""
