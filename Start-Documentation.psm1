function Start-Documentation {
    <#
    .SYNOPSIS
        Starts a PowerShell transcript with a consistent, timestamped filename in the user's Documents folder.

    .DESCRIPTION
        Creates a transcript file named Gabbs-yyyy-MM-dd-HHmm.txt (or a custom prefix)
        in the current user's Documents folder. Works cross-platform (Windows, macOS, Linux).

        The function uses the platform-native Documents location and starts the transcript
        with -NoClobber so it will not overwrite an existing file of the same name.

    .PARAMETER Prefix
        Optional prefix for the transcript filename. Defaults to "Gabbs".

    .PARAMETER Path
        Optional full path or directory for the transcript file.
        If not specified, the user's Documents folder is used.

    .EXAMPLE
        Start-Documentation

        Starts a transcript named Gabbs-<CurrentDateTime.txt> in your Documents folder.

    .EXAMPLE
        Start-Documentation -Prefix "MyScript"

        Starts a transcript named MyScript-2026-08-16-1009.txt.

    .EXAMPLE
        Start-Documentation -Path "C:\Temp\Logs"

        Starts a transcript in the specified folder (creates the folder if needed).

    .NOTES
        Author: Mark Gabryjelski
        Version: 1.0.0
        Requires: PowerShell 5.1+ or PowerShell 7+
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter()]
        [string]$Prefix = "Gabbs",

        [Parameter()]
        [string]$Path
    )

    # Determine the base directory
    if ($Path) {
        $baseDir = $Path
    }
    else {
        # Cross-platform Documents folder
        if ($IsWindows) {
            $baseDir = [Environment]::GetFolderPath('MyDocuments')
        }
        else {
            # macOS / Linux
            $baseDir = Join-Path $HOME "Documents"
        }
    }

    # Ensure the directory exists
    if (-not (Test-Path -LiteralPath $baseDir)) {
        New-Item -ItemType Directory -Path $baseDir -Force | Out-Null
    }

    $timestamp = Get-Date -Format "yyyy-MM-dd-HHmm"
    $fileName  = "$Prefix-$timestamp.txt"
    $fullPath  = Join-Path $baseDir $fileName

    if ($PSCmdlet.ShouldProcess($fullPath, "Start transcript")) {
        Start-Transcript -Path $fullPath -NoClobber
        Write-Verbose "Transcript started: $fullPath"
    }
}
