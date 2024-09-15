# URL der Datei auf GitHub
$url = "https://raw.githubusercontent.com/tvoelkner/avdpowershell/main/redirections.xml"

# Zielpfad auf dem lokalen System
$destination = "C:\temp\redirections.xml"

# Erstellen des Zielverzeichnisses, falls es nicht existiert
if (-not (Test-Path -Path "C:\temp")) {
    New-Item -ItemType Directory -Path "C:\temp"
}

# Herunterladen der Datei
Invoke-WebRequest -Uri $url -OutFile $destination

# Bestätigung der Dateiablage
if (Test-Path -Path $destination) {
    Write-Output "Die Datei wurde erfolgreich nach C:\temp heruntergeladen."
} else {
    Write-Output "Fehler beim Herunterladen der Datei."
}
