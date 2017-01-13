#Requires -Version 3

[CmdletBinding()]
param(    
)

if ((git remote) -notcontains "official") {
    Write-Verbose -Message "Creating remote for official depot"
    git remote add --tags official https://github.com/purcell/emacs.d
    git fetch official
}

<#$branches = git branch --list
$branches = (,$branches) | ForEach-Object -Process { $_.Substring(2) }
if ($branches -notcontains "Enclave/Common") {
    Write-Verbose -Message "Creating local branch Enclave/Common to track master depot"
    git fetch origin Enclave/Common:Enclave/Common
}
#>