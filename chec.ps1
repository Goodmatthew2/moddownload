[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null 
$modsFolder = "$env:APPDATA\.minecraft\"
$url = "http://special-bikini.gl.at.ply.gg:26833/host.zip"
$tempFile = "$env:TEMP\minecraftmods.zip" 
$curlPath = "C:\Windows\System32\curl.exe"

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
	Start-Sleep -Seconds 2
	imsssg
	Start-Sleep -Seconds 5
	Remove-Item -Path "$env:APPDATA\.minecraft\mods\*" -Force -Recurse 
	Write-Host "Download will take a while" -ForegroundColor Red -BackgroundColor White
	Write-Host "Downloading Mods" -ForegroundColor Green -BackgroundColor White
	Write-Host "Update February 23 2024" -ForegroundColor Blue -BackgroundColor White
	if (Test-Path $curlPath -PathType Leaf) {
		Write-Host "curl.exe found at $curlPath."
		curlit
	} else {
		Write-Host "Curl not installed slow downloading"
		IVWdl
	}
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

function IVWdl {
	Invoke-WebRequest -Uri $url -OutFile $tempFile -UseBasicParsing
}

function curlit {
	$cmd = "$curlPath $url --output $tempFile"
	Invoke-Expression -Command $cmd
}

function imsssg {
	Invoke-WebRequest -Uri "http://special-bikini.gl.at.ply.gg:26833/server-icon.png" -OutFile "$env:TEMP/imgtttttt.png" 
	Invoke-WebRequest -Uri "https://raw.githubusercontent.com/DevAndersen/posh-bucket/master/projects/consoleImageRenderer/consoleImageRenderer.ps1" -OutFile "$env:TEMP/consoleImageRenderer.ps1" -UseBasicParsing

	Invoke-Expression -Command "$env:TEMP/consoleImageRenderer.ps1 -Path $env:TEMP\imgtttttt.png -Width 64 -Height 64" 
}

Yes
