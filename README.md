
# WLSinterop

PowerShell profile for minimize environment switch

### Installation

Create a folder named ```WindowsPowerShell``` in your Documents folder. Then copy [this file](https://github.com/kidandcat/WLSinterop/blob/master/WindowsPowerShell%5CMicrosoft.PowerShell_profile.ps1) inside that folder with the name being ```Microsoft.PowerShell_profile.ps1```.

### Usage

After opening a new PowerShell window, all of your Linux commands will be available directly from powershell, without the need of using ```bash -c ""```.

Right now command autocomplete doesn't works, but windows paths will be parsed so you can autocomplete paths.

In administrator privileged command ```set-executionpolicy remotesigned```

### Recommended

```LxRun.exe /setdefaultuser root```
