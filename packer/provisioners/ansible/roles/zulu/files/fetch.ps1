# Turn off progress bar - really slows things down.
$ProgressPreference = 'SilentlyContinue' 

# The desired versions of Zulu.
$versions = "8","11","14"
foreach ($version in $versions)
{
  $msg = "Downloading JDK {0}" -f $version
  Write-Host $msg
  $jdkUri = "https://api.azul.com/zulu/download/community/v1.0/bundles/latest/binary/?jdk_version={0}&ext=tar.gz&os=linux&arch=x86&hw_bitness=64" -f $version
  $outfile = "zulu{0}.tar.gz" -f $version 
  Invoke-RestMethod -Uri $jdkUri -OutFile $outfile
}

$ProgressPreference = 'Continue'
