
#
# functions
#

Function Edit-Hosts {
	# execute notepad++ in elevated mode
    Start-Process C:\"Program Files"\Notepad++\notepad++.exe -Verb runAs -ArgumentList c:\Windows\System32\Drivers\etc\hosts
}

Function Edit-Profile {
	C:\"Program Files"\Notepad++\notepad++.exe C:\Users\flori\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
}


#
# aliases
#

Set-Alias -Name k -Value C:\ProgramData\chocolatey\bin\kubectl.exe
Set-Alias -Name f -Value C:\ProgramData\chocolatey\bin\fluxctl.exe
Set-Alias -Name edit -Value "C:\Program Files\Notepad++\notepad++.exe"
New-Alias which get-command
Set-Alias -Name hosts -Value Edit-Hosts
Set-Alias -Name hosts -Value Edit-Profile

#
# done
#	


Write-Host "Custom PowerShell Environment Loaded, please edit me at:"
Write-Host "C:\Users\flori\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
Write-Host ""


#
# good examples
#

# https://gist.github.com/timsneath/19867b12eee7fd5af2ba