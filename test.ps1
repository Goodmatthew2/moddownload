$modsFolder = "$env:APPDATA\.minecraft\mods" 
$url = "https://dl.dropboxusercontent.com/s/hi50804a1kjlek9/client.zip?dl=0" 
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
Remove-Item -Path "$env:APPDATA\.minecraft\mods\*" -Force -Recurse 
Write-Host "Download will take a while" -ForegroundColor Red -BackgroundColor White
Write-Host "Downloading 165MB mods" -ForegroundColor Green -BackgroundColor White
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Goodmatthew2/moddownload/main/ding.wav" -OutFile "$env:TEMP\ding.wav"
Invoke-WebRequest -Uri $url -OutFile $tempFile 
Write-Host "Extracting Mods" -ForegroundColor Blue -BackgroundColor Black
Expand-Archive -Path $tempFile -DestinationPath $modsFolder -Force 
Remove-Item $tempFile 
$mediaPlayer = New-Object System.Media.SoundPlayer
$mediaPlayer.SoundLocation = "$env:TEMP\ding.wav"
$mediaPlayer.Play()
Write-Host "Server Version: 1.19.2 Fabric" -ForegroundColor Green -BackgroundColor White
[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null 
[System.Windows.Forms.MessageBox]::Show("Finished Downloading Mods")
Remove-Item "$env:TEMP\ding.wav"
