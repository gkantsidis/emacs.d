#Requires -Version 3

[CmdletBinding()]
param(    
)

if ((git remote) -notcontains "purcell") {
    Write-Verbose -Message "Creating remote for official depot"
    git remote add --tags purcell https://github.com/purcell/emacs.d
    git fetch purcell
}
