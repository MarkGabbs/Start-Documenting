# Start-Documentation

A simple cross-platform PowerShell module that starts a transcript with a consistent, timestamped filename in the user's Documents folder.

## Features

- Works on Windows, macOS, and Linux
- Creates a transcript named `Gabbs-yyyy-MM-dd-HHmm.txt` (or a custom prefix)
- Uses the platform-native Documents folder by default
- Supports a custom path
- Uses `-NoClobber` so it will never overwrite an existing transcript
- Full comment-based help (`Get-Help Start-Documentation`)

## Installation

### Manual installation

1. Create the module folder:
   ```powershell
   # Windows
   New-Item -ItemType Directory -Path "$env:USERPROFILE\Documents\PowerShell\Modules\Start-Documentation" -Force

   # macOS / Linux
   New-Item -ItemType Directory -Path "$HOME/Documents/PowerShell/Modules/Start-Documentation" -Force
