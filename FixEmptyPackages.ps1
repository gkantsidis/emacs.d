[CmdletBinding(SupportsShouldProcess=$true)]
param(
    [switch]$RemoveEmpty
)

[object[]]$empty = Get-ChildItem .\elpa-25.1 -Include *.el -Recurse | Where-Object -Property Length -eq 0

foreach ($faulty in $empty) {
    Write-Warning -Message "File '$faulty' appears to be empty"
    $directory = $faulty.Directory

    if ($RemoveEmpty) {
        Remove-Item -Path $directory.FullName -Recurse -Force
    }
}