# Define the username you wish to grant "Log on as a service" permission
$userName = "YOUR_USER_NAME"

# Export the current security settings to a temporary file
$tempExport = "C:\temp_export.inf"
secedit.exe /export /cfg $tempExport

# Check if the user already has the permission
$content = Get-Content -Path $tempExport
if (-not ($content | Select-String -Pattern "SeServiceLogonRight")) {
    throw "Unable to find 'SeServiceLogonRight' in the security policy file."
}

# Append the username if it doesn't already exist in the list
$serviceLogonRight = ($content | Where-Object { $_ -like "*SeServiceLogonRight*" }) -split "=", 2 | Select-Object -Last 1
if (-not ($serviceLogonRight -like "*$userName*")) {
    $serviceLogonRight = $serviceLogonRight.Trim() + ",$userName"
    $content = $content -replace "(SeServiceLogonRight\s*=\s*.*)", "SeServiceLogonRight = $serviceLogonRight"
}

# Write the modified content back to the temp file
$content | Set-Content -Path $tempExport

# Import the modified security settings
secedit.exe /configure /db secedb.sdb /cfg $tempExport /quiet

# Clean up
Remove-Item -Path $tempExport -Force
