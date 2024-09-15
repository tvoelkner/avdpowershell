# Set time limit for disconnected sessions to 30 minutes
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name 'MaxDisconnectionTime' -Value 1800000

# Set time limit for active but idle Remote Desktop Services sessions to 30 minutes
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name 'IdleWinStationPoolTimeout' -Value 1800000

# Set time limit for logoff of RemoteApp Sessions to immediately
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'fLogoffTimeout' -Value 0