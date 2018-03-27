[CmdletBinding(SupportsShouldProcess=$true)]
param(
    [switch]$RemoveEmpty
)

[System.IO.DirectoryInfo[]]$elpa = Get-ChildItem -Path . -Filter elpa-* -Directory
if (($elpa -eq $null) -or ($elpa.Length -eq 0)) {
    Write-Error -Message "Cannot determine elpa directory"
    return
}
if ($elpa.Length -ge 2) {
    Write-Error -Message "Multiple elpa directories detected"
    return
}

[object[]]$empty = Get-ChildItem $elpa[0] -Include *.el -Recurse | Where-Object -Property Length -eq 0

foreach ($faulty in $empty) {
    Write-Warning -Message "File '$faulty' appears to be empty"
    $directory = $faulty.Directory

    if ($RemoveEmpty) {
        Remove-Item -Path $directory.FullName -Recurse -Force
    }
}