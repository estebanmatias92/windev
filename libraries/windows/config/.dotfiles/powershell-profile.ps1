# Rad code from URL and copy it to a file

$StartDir = ($Env:OneDrive) ? $Env:OneDrive : $Home 
$FilePath = "$($StartDir)\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

((New-Object System.Net.WebClient).DownloadString('https://gist.githubusercontent.com/estebanmatias92/863bc01532c6e9593de234b8f88b6bd6/raw/07657100f68b6be0714d2be5a0ad42593be291b0/powershell.profile.ps1')) > $FilePath