# Rad code from URL and copy it to a file

$StartDir = if ($Env:OneDrive) { $Env:OneDrive } else { $Home }
$FilePath = "$($StartDir)\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

((New-Object System.Net.WebClient).DownloadString('https://gist.githubusercontent.com/estebanmatias92/863bc01532c6e9593de234b8f88b6bd6/raw/Microsoft.PowerShell_profile.ps1')) > $FilePath

$FilePath