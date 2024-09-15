# Quellpfad der Datei
$source = "C:\Temp\redirections.xml"

# Zielpfad im Benutzerprofil
$destination = "$env:USERPROFILE\AppData\Local\FSLogix\redirections.xml"

# Erstellen des Zielverzeichnisses, falls es nicht existiert
$destinationDir = [System.IO.Path]::GetDirectoryName($destination)
if (-not (Test-Path -Path $destinationDir)) {
    New-Item -ItemType Directory -Path $destinationDir -Force
}

# Kopieren der Datei
Copy-Item -Path $source -Destination $destination -Force

# Bestätigung der Dateiablage
if (Test-Path -Path $destination) {
    Write-Output "Die Datei wurde erfolgreich nach $destination kopiert."
} else {
    Write-Output "Fehler beim Kopieren der Datei."
}
