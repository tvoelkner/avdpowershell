# Define the paths to exclude
$excludedPaths = @(
    "C:\Users\*\OneDrive",
    "C:\Users\*\AppData\Local\Microsoft\Office\16.0\OfficeFileCache",
    "C:\Users\*\AppData\Roaming\Microsoft\Teams"
)

# Function to set FSLogix exclusions
function Set-FSLogixExclusions {
    param (
        [string[]]$Paths
    )

    foreach ($path in $Paths) {
        # Add the exclusion to the registry
        New-ItemProperty -Path "HKLM:\SOFTWARE\FSLogix\Profiles" -Name "ExclusionList" -Value $path -PropertyType MultiString -Force
    }
}

# Apply the exclusions
Set-FSLogixExclusions -Paths $excludedPaths

Write-Output "FSLogix exclusions have been set successfully."
