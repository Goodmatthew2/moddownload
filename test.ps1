$modsFolder = "$env:APPDATA\.minecraft\mods"
$url = "https://dl.dropboxusercontent.com/s/ty45x6rrlwdg9sf/mods.zip?dl=0"
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

Invoke-WebRequest -Uri $url -OutFile $tempFile
Expand-Archive -Path $tempFile -DestinationPath $modsFolder -Force
Remove-Item $tempFile
[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null
[System.Windows.Forms.MessageBox]::Show("Finished Downloading Mods")
