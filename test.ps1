$modsFolder = "$env:APPDATA\.minecraft\mods" 
$url = "https://dl.dropboxusercontent.com/s/l6efk6bih78r56z/monewds.zip" 
$tempFile = "$env:TEMP\minecraftmods.zip" 
 
Remove-Item -Path "$env:APPDATA\.minecraft\mods\*" -Force -Recurse 
 
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
Write-Host "Download will take a while"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Goodmatthew2/moddownload/main/ding.mp3" -OutFile "$env:TEMP\ding.mp3"
Invoke-WebRequest -Uri $url -OutFile $tempFile 
Expand-Archive -Path $tempFile -DestinationPath $modsFolder -Force 
Remove-Item $tempFile 
$mediaPlayer = New-Object System.Media.SoundPlayer
$mediaPlayer.SoundLocation = "$env:TEMP\ding.mp3"
$mediaPlayer.Play()
[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null 
[System.Windows.Forms.MessageBox]::Show("Finished Downloading Mods")
