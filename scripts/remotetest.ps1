#This file is for testing remote calls via envoke-webRequest
# Call w/ '(iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/BenMitchell1979/azure-minecraft/master/scripts/remotetest.ps1')))>$null 2>&1'

(iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/BenMitchell1979/azure-minecraft/master/scripts/install_scriptcraft.ps1')))>$null 2>&1


