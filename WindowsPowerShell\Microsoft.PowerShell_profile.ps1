# Excluded commands to overwrite in PowerShell
$exclude = @("dir", "cd", "git", "node", "npm")

Set-PSReadlineKeyHandler -Key Tab -Function Complete
function bashFunc($cmd, $arg) {C:\windows\system32\bash.exe -c "sudo $cmd $arg"}
$MaximumFunctionCount = 30000
$pat = "^[a-zA-Z0-9\s]+$"
$cmds = bash -c "compgen -ac"
$ErrorActionPreference = "SilentlyContinue"
foreach ($c in $cmds) {
    if ($c -match $pat) {
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
        if (!$exclude.Contains("$c")){
            Remove-Item Alias:$c
        }
    }
}
$ErrorActionPreference = "Stop"
