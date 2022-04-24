# Rad code from URL and copy it to a file

$FilePath = "$($Env:LOCALAPPDATA)\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json"

((New-Object System.Net.WebClient).DownloadString('https://gist.githubusercontent.com/estebanmatias92/b1bfbf584ca8e18a70f6d46d89c88c27/raw/313dabca0c251e432d432d1f2eeca550e7277ba1/settings.json')) > $FilePath

$FilePath