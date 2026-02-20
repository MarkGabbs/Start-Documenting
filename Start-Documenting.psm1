<#
Cobbled together by Mark Gabryjelski
Latest version 2024-09-21
A simple module, to run "start-transcript" with a consistent file name Has qualifier to check which OS,
and use your home directories 'Documents' folder to keep PowerShell transcripts.

Place the Start-Docuemnting.psm1 file into:
~/Doccuments/PowerShell/Modules/Start-Dcoumenting/Start-Documenting.psm1
or
C:\Users%USERNAME%\Doccuments\PowerShell\Modules\Start-Dcoumenting\Start-Documenting.psm1
#>

Function Start-Documenting {
    [CmdletBinding()]
    param(
        [Parameter()]
        [string] $StartDateTime
    )

    $StartDateTime = get-date -format yyyy-MM-dd-HHmm

	if($IsWindows -eq "True"){
		$PathToFile="$env:USERPROFILE\Documents\Gabbs-$StartDateTime.txt"
	} elseif($IsMacOS -eq "True"){
		$PathToFile="~/Documents/Gabbs-$StartDateTime.txt"
	} elseif($IsLinux -eq "True"){
		$PathToFile="~/Documents/Gabbs-$StartDateTime.txt"
	} else {
	   write-host("This script has no idea what OS you are using")
	   $host.exit
	}

    Start-Transcript $PathToFile -NoClobber
}
