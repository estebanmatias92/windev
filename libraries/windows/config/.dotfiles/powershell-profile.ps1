# Rad code from URL and copy it to a file

((New-Object System.Net.WebClient).DownloadString('https://gist.githubusercontent.com/estebanmatias92/863bc01532c6e9593de234b8f88b6bd6/raw/07657100f68b6be0714d2be5a0ad42593be291b0/powershell.profile.ps1')) > $profile