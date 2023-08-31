Function Start-Documenting {
    [CmdletBinding()]
    param(
        [Parameter()]
        [string] $StartDateTime
    )

    $StartDateTime = get-date -format yyyy-MM-dd-hhmm

	if($IsWindows -eq "True"){
		$PathToFile="$env:USERPROFILE\Documents\WEI-$StartDateTime.txt"
	} elseif($IsMacOS -eq "True"){
		$PathToFile="~/Documents/WEI-$StartDateTime.txt"
	} elseif($IsLinux -eq "True"){
		$PathToFile="~/Documents/WEI-$StartDateTime.txt"
	} else {
	   write-host("This script has no idea what OS you are using")
	   $host.exit
	}

    Start-Transcript $PathToFile -NoClobber
}