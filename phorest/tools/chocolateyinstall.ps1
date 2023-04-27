$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://d3g0zp9xvxllui.cloudfront.net/memento/downloads/Phorest_windows-x32_8_4_40.exe' 
$packageName= 'Phorest'
$checksum = 'ba2fb18591b53cc720fcad8d60245aa6dcf580ff1f5ab3d5a5775e204935f380'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE' 
  url           = $url
  checksum		= $checksum
  checksumType	= 'sha256'
  softwareName  = 'Phorest*' 
  silentArgs   = '-q -overwrite'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs 

