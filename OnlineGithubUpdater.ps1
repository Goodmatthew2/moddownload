$url = "https://pastebin.com/raw/TvckgNuv"

# Define headers to prevent caching
$headers = @{
    "Cache-Control" = "no-cache"
    "Pragma"        = "no-cache"
}

# Fetch content from the URL
$content = Invoke-RestMethod -Uri $url -Headers $headers
Invoke-WebRequest -Uri $content -OutFile ./mods.zip
Expand-Archive ./mods.zip
Remove-Item ./mods.zip