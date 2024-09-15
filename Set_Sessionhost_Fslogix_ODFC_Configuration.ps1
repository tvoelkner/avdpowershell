# Pfad zur SMB-Dateifreigabe
$VHDLocation = "\\stafslogixavdprod.file.core.windows.net\fslogix\odfc"

# Registrierungseinträge für ODFC-Container
$registryPath = "HKLM:\\SOFTWARE\\Policies\\FSLogix\\ODFC"

# Erstellen des Registrierungspfads, falls nicht vorhanden
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Festlegen der Registrierungseinträge
New-ItemProperty -Path $registryPath -Name "Enabled" -Value 1 -PropertyType DWORD -Force
New-ItemProperty -Path $registryPath -Name "FlipFlopProfileDirectoryName" -Value 1 -PropertyType DWORD -Force
New-ItemProperty -Path $registryPath -Name "IncludeTeams" -Value 1 -PropertyType DWORD -Force
New-ItemProperty -Path $registryPath -Name "LockedRetryCount" -Value 3 -PropertyType DWORD -Force
New-ItemProperty -Path $registryPath -Name "LockedRetryInterval" -Value 15 -PropertyType DWORD -Force
New-ItemProperty -Path $registryPath -Name "ReAttachIntervalSeconds" -Value 15 -PropertyType DWORD -Force
New-ItemProperty -Path $registryPath -Name "ReAttachRetryCount" -Value 3 -PropertyType DWORD -Force
New-ItemProperty -Path $registryPath -Name "SizeInMBs" -Value 30000 -PropertyType DWORD -Force
New-ItemProperty -Path $registryPath -Name "VHDLocations" -Value $VHDLocation -PropertyType MULTI_SZ -Force
New-ItemProperty -Path $registryPath -Name "VolumeType" -Value "VHDX" -PropertyType REG_SZ -Force

Write-Output "ODFC-Container-Konfiguration abgeschlossen."
