# Excluded commands to overwrite in PowerShell
$exclude = @("dir", "cd", "git", "node", "npm", "code")

Set-PSReadlineKeyHandler -Key Tab -Function Complete
function bashFunc($cmd, $arg) {C:\windows\system32\bash.exe -c "sudo $cmd $arg"}
$MaximumFunctionCount = 30000
$pat = "^[a-zA-Z0-9\s]+$"
$cmds = bash -c "compgen -ac"
$ErrorActionPreference = "SilentlyContinue"
foreach ($c in $cmds) {
    if ($c -match $pat) {
        if ($exclude.Contains("$c")){
            continue
        }
        Remove-Item Alias:$c
        Set-Item -Path function:global:$c -Value {
            $arguments = $args
            $posixArgs = @()
            foreach ($arg in $arguments) {
                $arg = $arg.replace('C:', '/mnt/c')
                $arg = $arg.replace('\', '/')
                $posixArgs += $arg
            }
            Invoke-Expression "bashFunc(`"$($MyInvocation.MyCommand.Name)`", `"$posixArgs`")"
        }
    }
}
$ErrorActionPreference = "Stop"
