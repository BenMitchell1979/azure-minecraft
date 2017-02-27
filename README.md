# azure-minecraft
A collection of scripts for deploying and upgrading scriptcraft to Azure

The [azure-marketplace](./azure-marketplace) folder contains the source files for the [Azure Marketplace Minecraft Solution template](https://azuremarketplace.microsoft.com/en-us/marketplace/apps/msftstack.minecraft-server?tab=Overview).

The scripts folder contains:
- 'mineuuid.sh' : A script to get the Minecraft UUID
- 'mineserverupgrade.sh' : A script to upgrade your Azure minecraft server to a new version.
- 'install_scriptcraft.ps1' : A Powershell script to deploy Minecraft (working on adding scriptcraft pieces)
- 'install-scriptcraft.sh' : Install script (called by scriptcraft-on-ubuntu build) - this Bash script is what performs the install on Ubuntu.

The scriptcraft-on-ubuntu folder contains:
- Azure Template 'autodeploy.json' that will deploy a fully functional scriptcraft server using Ubuntu 16.04-LTS.
- Azure parameters file.  

The scriptcraft-on windows folder contains:
- Azure Template 'autodeploy.json' that will deploy a fully functional scriptcraft server on Windows 2016 VM (WinRM 5)

