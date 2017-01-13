#Requires -Version 3

[CmdletBinding()]
param(    
)

if ((git remote) -notcontains "purcell") {
    Write-Verbose -Message "Creating remote for official depot"
    git remote add --tags purcell https://github.com/purcell/emacs.d
    git fetch purcell
}

<#$branches = git branch --list
$branches = (,$branches) | ForEach-Object -Process { $_.Substring(2) }
if ($branches -notcontains "Enclave/Common") {
    Write-Verbose -Message "Creating local branch Enclave/Common to track master depot"
    git fetch origin Enclave/Common:Enclave/Common
}
#>