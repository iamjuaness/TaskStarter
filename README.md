# 🚀 Auto-Startup Script Configuration Guide  

This PowerShell script allows you to open applications and web pages based on the activity selected by the user (programming, studying, or entertainment).  

## 📌 Description  

**TaskStarter** is an automated tool that optimizes your workflow from the moment you turn on your PC. With just one selection, the system adjusts your environment according to your task, opening the necessary applications and web pages for coding, studying, or leisure. This PowerShell script simplifies your routine, saving time and boosting productivity.  

## ⚙️ Prerequisites  

1. **PowerShell enabled**: If you can't run scripts, open PowerShell as administrator and execute:  
   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```
2. **Correct program paths**: Edit the script to ensure the application paths match your system.  

## 🛠️ Installation and Usage  

1. **Download or copy the script** into a file with a `.ps1` extension, e.g., `startup.ps1`.  
2. **Edit the script** if necessary to update the program paths.  
3. **Run the script** in PowerShell:  
   ```powershell
   .\startup.ps1
   ```
4. **Select an option** when prompted to choose an activity:  
   - `1️⃣` for programming  
   - `2️⃣` for studying  
   - `3️⃣` for leisure  

## 🔄 Setting Up Auto-Execution on PC Startup  

To run the script automatically when Windows starts, follow these steps:  

1. **Press `Win + R`**, type `shell:startup`, and press `Enter`. This will open the Windows startup folder.  
2. **Create a PowerShell shortcut** in the startup folder:  
   - Right-click inside the startup folder and select `New > Shortcut`.  
   - In the shortcut location, enter:  
     ```
     powershell -ExecutionPolicy Bypass -File "C:\path\to\startup.ps1"
     ```
     (Replace `C:\path\to\startup.ps1` with the actual location of the script on your PC).  
   - Save the shortcut and test it by restarting your PC or double-clicking on the shortcut.  

## 🛠 Troubleshooting  

- If you see strange characters in the output, ensure your console is using UTF-8.  
- If a program doesn't open, check that the path in the script is correct.  
- If the script does not run on startup, verify that the shortcut in the startup folder has the correct path.  

## 🎨 Customization  

You can modify the applications that open or add new options by editing the `switch` statement in the script.  

---

This script enhances productivity by quickly launching the right environment for each activity. 🚀💻  
