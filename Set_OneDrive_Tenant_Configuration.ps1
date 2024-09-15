# Set registry keys for Known Folder Move (KFM) for OneDrive
$KFMPath = "HKLM:\Software\Policies\Microsoft\OneDrive"
$KFMOptIn = "KFMSilentOptIn"
$KFMOptInValue = f9852073-72a7-4434-b97c-ca2b418f082d

# Create the registry path if it doesn't exist
if (-not (Test-Path $KFMPath)) {
    New-Item -Path $KFMPath -Force
}

# Set the KFMOptIn registry key
Set-ItemProperty -Path $KFMPath -Name $KFMOptIn -Value $KFMOptInValue

# Pfad zur Registrierung
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\OneDrive"

# Schlüssel und Werte
$keysAndValues = @{
    "KFMSilentOptInDesktop" = 1
    "KFMSilentOptInDocuments" = 1
    "KFMSilentOptInPictures" = 1
    "FilesOnDemandEnabled" = 1
}

# Erstellen der Schlüssel und Setzen der Werte
foreach ($key in $keysAndValues.Keys) {
    New-ItemProperty -Path $registryPath -Name $key -Value $keysAndValues[$key] -PropertyType DWord -Force
}

Write-Output "Die Registrierungsschlüssel wurden erfolgreich erstellt und gesetzt."
