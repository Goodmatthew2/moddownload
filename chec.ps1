[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null 
$modsFolder = "$env:APPDATA\.minecraft\mods" 
$url = "http://pnode2.danbot.host:7105/uploads/minecraft.zip"
$tempFile = "$env:TEMP\minecraftmods.zip" 

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
	Write-Host "Update July 30 2023" -ForegroundColor Blue -BackgroundColor White
	Invoke-WebRequest -Uri $url -OutFile $tempFile -UseBasicParsing
	Invoke-WebRequest -Uri $zaeromap -OutFile $zaerotemp -UseBasicParsing
	Invoke-WebRequest -Uri $mod1 -OutFile $modsFolder -UseBasicParsing
	Invoke-WebRequest -Uri $mod2 -OutFile $modsFolder -UseBasicParsing
	Write-Host "Extracting Mods" -ForegroundColor Blue -BackgroundColor Black
	Expand-Archive -Path $tempFile -DestinationPath $modsFolder -Force 
	Remove-Item $tempFile 
	(New-Object Media.SoundPlayer "C:\Windows\Media\Windows Background.wav").Play()
	Write-Host "Mods Fabric Downloaded" -ForegroundColor Green -BackgroundColor White
	[System.Windows.Forms.MessageBox]::Show("Finished Downloading Mods")
	exit

	# Check if the source zip file exists
	if (-Not (Test-Path -Path $sourceZip -PathType Leaf)) {
		Write-Host "Error: The source zip file does not exist."
		exit 1
	}

	# Check if the destination folder exists, if not, create it
	if (-Not (Test-Path -Path $destinationFolder -PathType Container)) {
		New-Item -ItemType Directory -Force -Path $destinationFolder | Out-Null
	}

	# Extract the contents of the zip file to the destination folder
	try {
		Add-Type -AssemblyName System.IO.Compression.FileSystem
		[System.IO.Compression.ZipFile]::ExtractToDirectory($sourceZip, $destinationFolder)
		Write-Host "Extraction completed successfully."
	} catch {
		Write-Host "Error: $_"
		exit 1
	}
}

Yes
