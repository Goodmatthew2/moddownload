$url = "https://pastebin.com/raw/TvckgNuv"
$outputFile = "./mods.zip"
$fileToExtract = "./mods.zip"
$executable = "Lethal Company.exe"

# Function to receive content from a URL
function Receive-Content ($url) {
    try {
        $response = Invoke-WebRequest -Uri $url -UseBasicParsing
        if ($response.StatusCode -eq 200) {
            return $response.Content
        } else {
            return $response.StatusCode
        }
    } catch {
        return $_.Exception.Message
    }
}

# Function to download a file from a URL
function Download-File ($url, $outputFile) {
    try {
        $client = New-Object System.Net.WebClient
        $client.DownloadFile($url, $outputFile)
        return "Success!"
    } catch {
        return $_.Exception.Message
    }
}

# Function to extract a zip file
function Extract-ZipFile ($file) {
    try {
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        [System.IO.Compression.ZipFile]::ExtractToDirectory($file, ".")
    } catch {
        return $_.Exception.Message
    }
}

# Main function
function Main {
    if (Test-Path $executable) {
        # Lethal Company.exe exists, do nothing
    } else {
        [System.Windows.MessageBox]::Show("Could not find Lethal Company.exe please make sure you have this program in the correct location!", "Lethal Mod Updater", "Error")
        exit 0
    }

    $urlResult = Receive-Content -url $url
    if ($urlResult -is [int]) {
        write-Host "Error: $urlResult"
        exit $urlResult
    }

    $downloadResult = Download-File -url $urlResult -outputFile $outputFile
    if ($downloadResult -eq "Success!") {
        Extract-ZipFile -file $fileToExtract
        Remove-Item $fileToExtract
        write-Host "Zip file extracted successfully."
    } else {
        write-Host "Error: $downloadResult"
    }
}

Main
