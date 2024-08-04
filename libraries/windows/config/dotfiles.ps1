$RootDir = (get-item $PSScriptRoot).parent.parent.parent.FullName
# -------------------------------------
# Imports
# -------------------------------------
. $RootDir\helpers\misc.ps1


# Copying User configuration
# List of configuration files
$downloads = @(
    [PSCustomObject]@{
        Url = "https://gist.githubusercontent.com/estebanmatias92/79083d148344f9e565679e6551a65074/raw/Microsoft.PowerShell_profile.ps1"
        Destination = "$($Env:OneDrive ?? $Home)\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
    },
    [PSCustomObject]@{
        Url = "https://gist.githubusercontent.com/estebanmatias92/79083d148344f9e565679e6551a65074/raw/2fa69cbf0ccb9c2dc3fddb205a460de1906e398b/terminal.settings.json"
        Destination = "$Env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json"
    }
)

# Download files using the list
Write-Subtitle "Downloading files: Microsoft.PowerShell_profile.ps1, settings.json (terminal)"

foreach ($file in $downloads) {
    Invoke-WebRequest -Uri $file.Url -OutFile $file.Destination
}

Write-Host "Config files were downloaded and copied."
Write-Host ""

Start-Sleep 2