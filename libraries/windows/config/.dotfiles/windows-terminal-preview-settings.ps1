# Rad code from URL and copy it to a file

$FilePath = "$($Env:LOCALAPPDATA)\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json"

((New-Object System.Net.WebClient).DownloadString('https://gist.githubusercontent.com/estebanmatias92/b1bfbf584ca8e18a70f6d46d89c88c27/raw/54a00a830ad27dad9325cc19604ec64576ea26c4/settings.json')) > $FilePath

$FilePath