# Turn off progress bar - really slows things down.
$ProgressPreference = 'SilentlyContinue' 

# The desired versions of Adoptium.
$versions = "8","11","14"
foreach ($version in $versions)
{
  $msg = "Downloading JDK {0}" -f $version
  Write-Host $msg
  $jdkUri = "https://api.adoptopenjdk.net/v3/binary/latest/{0}/ga/linux/x64/jdk/hotspot/normal/adoptopenjdk" -f $version
  $outfile = "adoptium{0}.tar.gz" -f $version 
  Invoke-RestMethod -Uri $jdkUri -OutFile $outfile
}

$ProgressPreference = 'Continue'
