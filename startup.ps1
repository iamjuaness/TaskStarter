# Script to open applications according to the selected activity

# Define application paths
$warpPath = "C:\Users\cardo\AppData\Local\Programs\Warp\warp.exe"
$notepadPath = "C:\Windows\notepad.exe"
$bravePath = "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"
$obsidianPath = "C:\Users\cardo\AppData\Local\Programs\Obsidian\Obsidian.exe"
$spotifyPath = "C:\Users\cardo\OneDrive\Escritorio\Spotify - Shortcut.lnk"

# Define URLs for the browser
$githubUrl = "https://github.com/"
$chatGptUrl = "https://chatgpt.com/"
$driveUrl = "https://drive.google.com/"
$classroomUrl = "https://classroom.google.com/"
$youtubeUrl = "https://www.youtube.com/"

# Set UTF-8 in the console and in the output
$OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Change the code page to UTF-8
chcp 65001 | Out-Null

# Function to check for Internet connection
function Test-InternetConnection {
    try {
        $response = Test-NetConnection -ComputerName "8.8.8.8" -InformationLevel Quiet
        return $response
    } catch {
        return $false
    }
}

# Wait until Internet connection is available
Write-Host "Verifying Internet connection..."
while (-not (Test-InternetConnection)) {
    Write-Host "No connection. Waiting 5 seconds..."
    Start-Sleep -Seconds 5
}

Write-Host "Internet connection established. Continuing..."


# Function to check if the programme exists and run it
function Start-Program {
    param (
        [string]$programPath,
        [string]$arguments = ""
    )
    if (Test-Path $programPath) {
        if ($arguments) {
    		Start-Process -FilePath $programPath -ArgumentList $arguments
	} else {
    		Start-Process -FilePath $programPath
	}

    } else {
        Write-Warning "The programme was not found in: $programPath"
    }
}

# Ask the user what activity he/she is going to perform
$activity = Read-Host "What are you going to do today (1. programming, 2. studying, 3. leisure)?"

switch ($activity.ToLower()) {
    "1" {
        Write-Host "Opening programming environment..."
        Start-Program -programPath $warpPath
        Start-Program -programPath $notepadPath
	Start-Program -programPath $spotifyPath
        Start-Program -programPath $bravePath -arguments "$githubUrl $chatGptUrl"
    }
    "2" {
        Write-Host "Opening study environment..."
        Start-Program -programPath $obsidianPath
        Start-Program -programPath $bravePath -arguments "$classroomUrl $driveUrl $chatGptUrl"
    }
    "3" {
        Write-Host "Opening up a leisure environment..."
        Start-Program -programPath $spotifyPath
        Start-Program -programPath $bravePath -arguments "$youtubeUrl"
    }
    default {
        Write-Host "Invalid option. No applications will be opened."
    }
}

Write-Host "You're done! Enjoy your session."
