#Get current time
$currentTime = Get-Date

Write-Output "Install started: $currentTime"

# 3D Viewer:
Get-AppxPackage Microsoft.Microsoft3DViewer | Remove-AppxPackage
# 3D Paint:
Get-AppxPackage Microsoft.MSPaint | Remove-AppxPackage
# Calculator:
Get-AppxPackage *windowscalculator* | Remove-AppxPackage
# 3D Builder:
Get-AppxPackage *3dbuilder* | Remove-AppxPackage
# Calendar and Mail:
Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage
# Alarms and Clock:
Get-AppxPackage *windowsalarms* | Remove-AppxPackage
# Camera:
Get-AppxPackage *windowscamera* | Remove-AppxPackage
# Uninstall Get Help:
Get-AppxPackage *Microsoft.GetHelp* -AllUsers | Remove-AppxPackage
# Get Office:
Get-AppxPackage *officehub* | Remove-AppxPackage
# Get Started:
Get-AppxPackage *getstarted* | Remove-AppxPackage
# Get Skype:
Get-AppxPackage *skypeapp* | Remove-AppxPackage
# Groove Music:
Get-AppxPackage *zunemusic* | Remove-AppxPackage
# Maps:
Get-AppxPackage *windowsmaps* | Remove-AppxPackage
# Microsoft Solitaire Collection:
# Get-AppxPackage *solitairecollection* | Remove-AppxPackage
# Mixed Reality:
Get-AppxPackage Microsoft.MixedReality.Portal | Remove-AppxPackage
# Money:
Get-AppxPackage *bingfinance* | Remove-AppxPackage
# Movies & TV:
Get-AppxPackage *zunevideo* | Remove-AppxPackage
# News:
Get-AppxPackage *bingnews* | Remove-AppxPackage
# OneNote:
Get-AppxPackage *onenote* | Remove-AppxPackage
# Phone Companion:
Get-AppxPackage *windowsphone* | Remove-AppxPackage
# Photos:
Get-AppxPackage *photos* | Remove-AppxPackage
# Sports:
Get-AppxPackage *bingsports* | Remove-AppxPackage
# Store:
Get-AppxPackage *windowsstore* | Remove-AppxPackage
# Voice Recorder:
# Get-AppxPackage *soundrecorder* | Remove-AppxPackage
# Weather:
# Get-AppxPackage *bingweather* | Remove-AppxPackage

# Xbox:
Get-AppxPackage *xboxapp* | Remove-AppxPackage
Get-ProvisionedAppxPackage -Online | `
Where-Object { $_.PackageName -match "xbox" } | `
ForEach-Object { Remove-ProvisionedAppxPackage -Online -AllUsers -PackageName $_.PackageName }

Get-AppxPackage -AllUsers Microsoft.XboxGamingOverlay | Remove-AppxPackage

#Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco upgrade chocolatey -y

choco install packages.config -y

#Create new folder on deksktop called "Program Manager"
mkdir "$HOME/Desktop/Program Manager"

#Move all shortcuts on desktop to folder called "Program Manager"
Move-Item C:/Users/Public/Desktop/*.lnk "$HOME/Desktop/Program Manager"
Move-Item C:/Users/Public/Desktop/*.url "$HOME/Desktop/Program Manager"
Move-Item C:/Users/james/Desktop/*.lnk "$HOME/Desktop/Program Manager"
Move-Item C:/Users/james/Desktop/*.url "$HOME/Desktop/Program Manager"

#Run ccleaner from application folder
"C:\Program Files\CCleaner\CCleaner.exe"
$elapsedTime = $(get-date) - $currentTime 

$totalTime = "{0:HH:mm:ss}" -f ([datetime]$elapsedTime.Ticks)

Write-Output "Install finished in: $totalTime"
