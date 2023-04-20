[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null 
$modsFolder = "$env:APPDATA\.minecraft\mods" 
$url = "https://dl.dropbox.com/s/7kd2qkzqs24dj6b/mods.zip?dl=0"
$clienturl = "https://dl.dropbox.com/s/e6wrsstppj69wie/client.zip?dl=0"
$tempFile = "$env:TEMP\minecraftmods.zip" 

function hi {
	$choice = Read-Host "Download ClientMods? (Y/N)"
	if ($choice -eq "Y") {
		Yes
	} elseif ($choice -eq "N") {
		No
	} else {
		Write-Host "Invalid choice. Please enter Y or N."
		hi
	}
}

hi

Write-Host @"
                                                __                                    
                            /'\_/`\            /\ \                                   
                           /\      \    ___    \_\ \                                  
                           \ \ \__\ \  / __`\  /'_` \                                 
                            \ \ \_/\ \/\ \L\ \/\ \L\ \                                
                             \ \_\\ \_\ \____/\ \___,_\                               
                              \/_/ \/_/\/___/  \/__,_ /                               
                                                                                      
                                                                                      
 ____                                 ___                        __                   
/\  _`\                              /\_ \                      /\ \                  
\ \ \/\ \    ___   __  __  __    ___ \//\ \     ___      __     \_\ \     __   _ __   
 \ \ \ \ \  / __`\/\ \/\ \/\ \ /' _ `\ \ \ \   / __`\  /'__`\   /'_` \  /'__`\/\`'__\ 
  \ \ \_\ \/\ \L\ \ \ \_/ \_/ \/\ \/\ \ \_\ \_/\ \L\ \/\ \L\.\_/\ \L\ \/\  __/\ \ \/  
   \ \____/\ \____/\ \___x___/'\ \_\ \_\/\____\ \____/\ \__/.\_\ \___,_\ \____\\ \_\  
    \/___/  \/___/  \/__//__/   \/_/\/_/\/____/\/___/  \/__/\/_/\/__,_ /\/____/ \/_/  
                                                                                      
                                                                                      
"@ 

function Yes {
	Remove-Item -Path "$env:APPDATA\.minecraft\mods\*" -Force -Recurse 
	Write-Host "Download will take a while" -ForegroundColor Red -BackgroundColor White
	Write-Host "Downloading Mods" -ForegroundColor Green -BackgroundColor White
	Write-Host "Update April 12 2023" -ForegroundColor Blue -BackgroundColor White
	Invoke-WebRequest -Uri $url -OutFile $tempFile -UseBasicParsing
	Write-Host "Extracting Mods" -ForegroundColor Blue -BackgroundColor Black
	Expand-Archive -Path $tempFile -DestinationPath $modsFolder -Force 
	Remove-Item $tempFile 
	(New-Object Media.SoundPlayer "C:\Windows\Media\Windows Background.wav").Play()
	Write-Host "Server Version: 1.19.3 Forge" -ForegroundColor Green -BackgroundColor White
	[System.Windows.Forms.MessageBox]::Show("Finished Downloading Mods")
	exit
}

function No {
	Remove-Item -Path "$env:APPDATA\.minecraft\mods\*" -Force -Recurse 
	Write-Host "Download will take a while" -ForegroundColor Red -BackgroundColor White
	Write-Host "Downloading Mods" -ForegroundColor Green -BackgroundColor White
	Write-Host "Update April 20 2023" -ForegroundColor Blue -BackgroundColor White
	Invoke-WebRequest -Uri $clienturl -OutFile $tempFile -UseBasicParsing
	Write-Host "Extracting Mods" -ForegroundColor Blue -BackgroundColor Black
	Expand-Archive -Path $tempFile -DestinationPath $modsFolder -Force 
	Remove-Item $tempFile 
	(New-Object Media.SoundPlayer "C:\Windows\Media\Windows Background.wav").Play()
	Write-Host "Server Version: 1.19.4 Fabric/Vanilla/Paper" -ForegroundColor Green -BackgroundColor White
	[System.Windows.Forms.MessageBox]::Show("Finished Downloading Mods")
	exit
}
