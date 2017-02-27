#This file is for testing remote calls via envoke-webRequest
# Call w/ '(iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/BenMitchell1979/azure-minecraft/master/scripts/remotetest.ps1')))>$null 2>&1'
mkdir $env:USERPROFILE\temp\
New-Item $env:USERPROFILE\temp\test.txt


