# Set User to Log on as a Service

This PowerShell script is designed to automate the process of granting the "Log on as a service" permission to a specified user in Windows environments. It simplifies the process for system administrators and ensures consistency in security settings across multiple systems.

## Features

- **Automated Permission Setting**: Quickly grant "Log on as a service" permissions to a specified user account.
- **Security Policy Export and Import**: Safely modifies the system's security policy by exporting to a temporary file, making changes, and then importing the updated policy.
- **Error Checking**: Checks for the existence of the required security settings and handles exceptions.

## Prerequisites

- Windows operating system with PowerShell.
- Administrator privileges are required to run the script.

## Installation

No installation is needed. Just download the `SetUserLogonAsService.ps1` file to your local machine.

## Usage

1. Open the script in a text editor.
2. Replace `YOUR_USER_NAME` in the `$userName` variable with the actual username you wish to grant permissions to.
3. Run the script in PowerShell as an administrator.
