import-module au

$releases = 'https://www.phorest.com/us/downloads/'
$versionRegex = '-([0-9]+\.[0-9]+\.[0-9]+).Setup\.exe$'

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"           #1
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"      #2
        }
    }
}

function global:au_GetLatest {
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing #1
     $regex   = '.exe$'
     $url     = $download_page.links | ? href -match $regex | select -First 1 -expand href #2
	 $url -match $versionRegex
	 $version = $Matches[1]
     return @{ Version = $version; URL32 = $url }
}

update -ChecksumFor 32
