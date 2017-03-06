# Script to download and install Minecraft server on a clean Windows machine
# Call w/ '(iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/BenMitchell1979/azure-minecraft/master/scripts/install_scriptcraft.ps1')))>$null 2>&1'

# Pending Items:
# - Add port rule for Windows Firewall
# - Deploy Scriptcraft mod
# - Pull in custom server.properties file vs default
# - create Minecraft windows service



# Setup Variables for script
$minecraftVersion = "1.8.8" # Required for Scriptcraft to work (does not support newer builds)
$minecraftJar = "minecraft_server." + $minecraftVersion + ".jar"
$clientURL = "https://launcher.mojang.com/download/MinecraftInstaller.msi"       #fetch Minecraft Installer // replace this with Storage Blob link later
$webclient = New-Object System.Net.WebClient
$minecraftServerPath = $env:USERPROFILE + "\minecraft_server\"                   # Build out MC Server folder.

# install chocolatey to make my life easier
(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')))>$null 2>&1
Write-Output "Chocolatey Installed!"

# download and install Minecraft client because we need this for scriptcraft (version 1.8 only supported for now)
$filePath = $env:USERPROFILE + "\Downloads\" + $clientExe
Write-Output "Downloading Minecraft MSI"
$webclient.DownloadFile($clientURL,$filePath)
# install Minecraft client
Write-Output "Installing Minecraft!" 
msiexec /quiet /i $filePath

# install java via chocolatey instead of installing from download.
Write-Output "Installing JRE!"
choco install -y -force javaruntime

# build out Path Vars
Write-Output "Building Path Variables:"
$env:PATH = [System.Environment]::GetEnvironmentVariable("PATH","Machine") # Reload PATH from Java Install in current session
$javaCommand = get-command java.exe
$javaPath = $javaCommand.Name
$jarPath = $minecraftServerPath + $minecraftJar

# download Minecraft server
mkdir $minecraftServerPath
Write-Output "Download Minecraft Server:"
$url = "https://s3.amazonaws.com/Minecraft.Download/versions/" + $minecraftVersion + "/" + $minecraftJar
$webclient.DownloadFile($url,$jarPath)

# launch Minecraft server for first time
cd $minecraftServerPath

mkdir logs
out-file -filepath .\server.properties -encoding ascii -inputobject ""
out-file -filepath .\banned-ips.json -encoding ascii -inputobject "[]`n"
out-file -filepath .\banned-players.json -encoding ascii -inputobject "[]`n"
out-file -filepath .\ops.json -encoding ascii -inputobject "[]`n"
out-file -filepath .\usercache.json -encoding ascii -inputobject "[]`n"
out-file -filepath .\whitelist.json -encoding ascii -inputobject "[]`n"
out-file -filepath .\eula.txt -encoding ascii -inputobject "eula=true`n" 
Write-Output "Launching Minecraft!"
iex "$javaPath -Xmx2048M -Xms2048M -jar $jarPath nogui" #Start Minecraft Server
