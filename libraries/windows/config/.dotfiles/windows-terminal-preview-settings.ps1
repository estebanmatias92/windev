# Rad code from URL and copy it to a file

((New-Object System.Net.WebClient).DownloadString('https://gist.githubusercontent.com/estebanmatias92/b1bfbf584ca8e18a70f6d46d89c88c27/raw/2a73780fbc8f17d5cabac7df22f4ba23f3e5eeac/terminal-preview-settings.json')) > "$($Env:LOCALAPPDATA)\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json"