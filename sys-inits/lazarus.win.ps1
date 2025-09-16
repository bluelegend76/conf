Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
# __
# choco search vim

# General Updating with Chocolatey
# choco upgrade all -y

# Windows-updates from PowerShell ----
# Here's a breakdown of the process:
# 
# Install the PSWindowsUpdate module:
# Install-Module -Name PSWindowsUpdate -Force 
# 
# Import-Module PSWindowsUpdate 
# Get-WindowsUpdate  # Check for updates
# Install-WindowsUpdate -AcceptAll  # Install updates
# 
# 
# -AcceptAll: This parameter automatically accepts all available updates.
# 
# (Optional) Reboot (if required):
# The Install-WindowsUpdate cmdlet can optionally handle the reboot automatically. However, it's often safer to manually reboot after installing updates.
# 
# Important Notes:
# Run as Administrator: You must run PowerShell as administrator to use these cmdlets.
# Careful with -AcceptAll: This parameter will install all available updates, including optional and driver updates.
# Consider Scheduling: You can schedule the Install-WindowsUpdate command using Task Scheduler to automate the update process at a convenient time.

choco install azure-cli -y
# run with 'az'/'az.cmd' in PowerShell
# refreshenv
# Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1
choco install doxygen.install Graphviz -y
choco install pandoc -y
# TODO: INCLUDE LINK FOR DOWNLOADING/INSTALLING MSKEYBCREATOR
choco install balabolka -y
# choco install miktek -y
  choco install puppet-server -y
# Start with 'wt'
choco install microsoft-windows-terminal -y
# https://windowsterminalthemes.dev/
# Abernathy
# Andromeda
# Firefly Traditional
# FishTank
# Grey-green
# TokyoNight
# Twilight
# UltraDark
# UltraViolent
# UnderTheSea

choco upgrade git -y
choco install vim -y
# ___Vundle_Windows=install

choco install autohotkey -y
choco install powertoys -y
# pdf reader (with dark mode / command-line-based search)
choco install foxitreader -y
choco install sumatrapdf.install -y
choco install mpv -y
choco install freecommander -y
choco install keepassx -y
choco install vlc -y

# choco install neovim -y
# choco install nodejs-lts
# choco install yarn

choco install nushell -y
# choco install python -y
choco install jupyter python3-virtualenv -y
# choco install jupyterlab -y

choco install emacs.install -y
# Install DotNet Interactive
dotnet tool install -g Microsoft.DotNet.Interactive
# Register the DotNet Interactive kernel with Jupyter
dotnet try jupyter install

choco install clojure lein -y
# pip install xonsh
# wsl --install
# choco install ImageMagick
  choco install sbcl -y

choco install discord -y
# https://www.autohotkey.com/scite4ahk/dl/s4ahk-install.exe
choco install gimp -y
choco install inkscape -y
choco install audacity -y
choco install obs-studio.install -y
# choco install digiKam -y

# Find executable path for program 'gimp' in PowerShell
# $files = Get-ChildItem -Path "C:\Program Files" -Recurse
# $gimpFiles = $files | Where-Object {$_.Name -match "gimp"}
# $gimpExe = $gimpFiles | Where-Object {$_.Extension -eq ".exe"}
# Write-Host "GIMP Executable Path: " $gimpExe.FullName
#    //
# Get-ChildItem -Path "C:\Program Files" -Recurse |
#         Where-Object {$_.Name -match "gimp\.exe"} |
#         Select-Object -First 1 |
#         Resolve-Path
#
# Set-Alias -Name vlc "C:\Program Files\VideoLAN\VLC\vlc.exe"
# Set-Alias -Name gimp "C:\Program Files\GIMP 2\bin\gimp-2.10.exe"

# Enable better tab-completion in PowerShell
Install-Package -Name PSReadLine -Scope CurrentUser
Import-Module PSReadLine

choco install azure-cli -y

# C# Interactive in PowerShell
# You can achieve C# interactive within PowerShell using the Add-Type cmdlet. Here's how:
# 
# 1. Define your C# code within a script block:
# PowerShell
# 
# $code = @"
# using System;
# 
# public class MyClass {
#     public static int Add(int a, int b) {
#         return a + b;
#     }
# }
# "@
# 
# Add-Type -TypeDefinition $code
# 
# # Now you can call the C# method
# [MyClass]::Add(5, 3) 
# 
# Explanation:
# 
#     $code = @" ... @": This creates a multi-line string containing your C# code.
#     Add-Type -TypeDefinition $code: This cmdlet dynamically compiles the C# code within the script block.
#     [MyClass]::Add(5, 3): This line calls the Add method of the MyClass that you defined in C#.
# 
# Key Points:
# 
#     Simple Examples: This method is well-suited for simple C# code snippets and quick testing.
#     Limitations:
#         For more complex C# code or larger projects, consider using a dedicated C# IDE or a more robust development environment.
#         This approach might not be ideal for long-term development or complex scenarios.
# 
# Alternative:
# 
#     .NET Interactive: This is a more modern approach that provides a richer interactive experience. It can be installed as a global tool using the .NET CLI:
# 
#     dotnet tool install --global Microsoft.dotnet-interactive
# 
#     After installation, you can use the dotnet-interactive command-line tool to execute C# code interactively.
# 
# I hope this helps! Let me know if you have any other questions.

### Setting up symbolic links to the Config-files in Windows ###
# TODO: Replace 'hard-coded' user with 'Select User' to link to
# C:\Users\SEDAALB2>
# TODO: LINK IN VIM COLOR-SCHEMES (AND SPELLING DICTIONARIES ETC)
cd ~
New-Item -ItemType SymbolicLink -Path .\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json -Target .\RiderProjects\bluelegend76\ms-winterminal\settings.json
New-Item -ItemType SymbolicLink -Path _vimrc -Target .\RiderProjects\bluelegend76\_vimrc
  # New-Item -ItemType SymbolicLink -Path _vimrc -Target .\RiderProjects\bluelegend76\.winvimrc
# DONE: CHECK IF CAN SYMLINK TO DIRECTORIES
# TODO: May want to use 'mklink /D linkname targetname'
New-Item -ItemType SymbolicLink -Path AppData\Roaming\.emacs.d -Target .\RiderProjects\bluelegend76\.emacs.d
# TODO: May want to link in Contents of .emacs.d (on GitHub) into AppData\Roaming\.emacs.d
# (which is created by the Emacs installer)
# + NEEDS QUICKLISP INSTALLED IN .emacs.d FOR SLIME TO WORK
New-Item -ItemType SymbolicLink -Path Desktop\Dashboard.Empire.txt -Target .\RiderProjects\bluelegend76\rsc\data\lists\at\Dashboard.Empire.txt
# PowerShell profile (setting custom functions, aliases, etc.)
New-Item -ItemType SymbolicLink -Path Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 -Target .\RiderProjects\bluelegend76\Microsoft.PowerShell_profile.ps1
# Link in .vim directory (spell, colors, etc.)
New-Item -ItemType SymbolicLink -Path .vim -Target .\RiderProjects\bluelegend76\vim
# TODO: CLONE + ADD VUNDLE
New-Item -ItemType SymbolicLink -Path .ideavimrc -Target .\RiderProjects\bluelegend76\.ideavimrc
# LINK-IN vscode-settings
# LINK-IN bluelegend.kdbx -> HOME (=????)

# WSL/Ext4
# sudo modprobe ext4

# https://cdn.insynchq.com/builds/win/Insync-3.8.7.50505.exe
# Download the Insync installer (replace with the actual download URL)
$downloadUrl = "https://download.insync.com/latest/windows/insync-setup.exe" 
$installerPath = "$env:TEMP\insync-setup.exe" 

# Download the installer using Invoke-WebRequest
Invoke-WebRequest -Uri $downloadUrl -OutFile $installerPath

# Execute the installer (adjust the arguments as needed)
Start-Process -FilePath $installerPath -ArgumentList "/S"


# Download + Start installer for Dlang/DMD ----

# Install VeraCrypt ----
# Define the URL of the VeraCrypt installer
$veracryptInstallerUrl = "https://www.veracrypt.fr/en/Downloads"

# Download the installer
try {
    Invoke-WebRequest -Uri $veracryptInstallerUrl -OutFile "veracrypt_setup.exe"
    Write-Host "VeraCrypt installer downloaded successfully."
} catch {
    Write-Host "Error downloading VeraCrypt installer: $($_.Exception.Message)"
    exit 1
}

# Launch the installer (basic example)
Start-Process -FilePath ".\veracrypt_setup.exe"


# - Question: Is there a keyboard shortcut in Windows 10 to move the active app/window to the next desktop? I.e. grabbing and moving it with the mouse is kind of tedious
# 
# Unfortunately, there isn't a single, dedicated keyboard shortcut to directly move the active app/window to the next desktop in Windows 10.
# 
# However, here are a few workarounds to achieve this efficiently:
# 
# Using Task View:
# 
# Press Windows key + Tab to open Task View.
# Right-click on the window you want to move.
# Select "Move to" and then choose the desired desktop.
# Using AutoHotkey (third-party tool):
# You can create a custom script using AutoHotkey to assign a keyboard shortcut for this action. Here's a basic example:
# 
# AutoHotkey
# 
# ^!Right::
# WinGetActiveTitle, A_ActiveWindowTitle
# WinGetActiveProcess, A_ActiveProcess
# Run, powershell.exe -Command "((Get-WmiObject Win32_Process -Filter \"Name='%A_ActiveProcess%'\" | Get-CimInstance -ClassName Win32_Process).Handle).ToInt32() | ForEach-Object { [System.Runtime.InteropServices.Marshal]::GetObjectForIUnknown($_) } | Invoke-Command -ScriptBlock { Move-Window -Handle $using:handle -Desktop 2 }"
# Return
# This script moves the active window to the second desktop when you press Ctrl + Alt + Right Arrow.
# You'll need to install AutoHotkey and modify the script to suit your needs (e.g., change the target desktop number).
# Note: These are the most efficient methods currently available. Microsoft may introduce a dedicated shortcut in future Windows updates.
# 
# 
# - Quick follow-up on that one: Do I need to install something to be able run AutoHotkey-scripts (which I suspect)? And, can it be installed using Chocolatey?
# 
# You're right, you'll need to install AutoHotkey to run its scripts.
# 
# Installation:
# 
# Manual: Download the installer from the official AutoHotkey website (autohotkey.com) and run it.
# Chocolatey:
# Open an elevated command prompt: Search for "cmd" in the Start Menu, right-click on "Command Prompt," and select "Run as administrator."
# 
# Install Chocolatey: If you haven't already, run the following command in the elevated command prompt:
# 
# @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "ChocolateyInstall=" & (& '$env:ChocolateyInstall')
# Install AutoHotkey: Once Chocolatey is installed, run the following command in the elevated command prompt:
# 
# choco install autohotkey
# Running Scripts:
# 
# After installation, you can create or download AutoHotkey scripts (.ahk files).
# To run a script, double-click the .ahk file.
# I hope this helps!
# 
# If I would like to collect a bunch of commands to be run after I have installed Windows (mostly 10, but maybe also some 11), what file extension would be reasonable to put on a file?
# 
# The most suitable file extension for a collection of commands to be run after installing Windows 10 or 11 is .bat or .cmd.
# 
# Here's why:
# 
# .bat and .cmd are standard extensions for batch files in Windows.
# Batch files are simple scripts that contain a series of commands to be executed by the command-line interpreter (cmd.exe).
# They are easy to create and edit using any plain text editor like Notepad.
# Windows can directly execute these files by double-clicking them.
# Example:
# 
# Code snippet
# 
# @echo off
# echo Installing necessary software...
# echo.
# # Install software using tools like Chocolatey or scoop
# choco install <software1> <software2> ...
# # Run other commands as needed
# net user Administrator /active:yes 
# shutdown /r /t 0 
# This example batch file:
# 
# Disables echoing of commands to the console.
# Displays a message indicating the start of the installation process.
# Installs software using a package manager like Chocolatey or scoop.
# Activates the Administrator account.
# Restarts the computer.
# Note:
# 
# You can customize the commands within the batch file to suit your specific needs.
# It's recommended to test your batch file thoroughly in a safe environment before running it on a freshly installed system.
# By using .bat or .cmd files, you can automate the post-installation tasks and save time and effort.
# 
# 
# 
# - And if I also would like to be able to run a line or two of PowerShell code, would it be more reasonable to put the file-extension .ps1 on the file, and (maybe crucially) would I need to pad the lines with Chocolatey commands in some PowerShell code?
# 
# You're absolutely right! For PowerShell code, the appropriate file extension is .ps1.   
# 
# Here's how you can integrate Chocolatey commands within your PowerShell script:
# 
# 1. Direct Execution:
# 
# You can directly execute Chocolatey commands within your PowerShell script using the choco command.
# 
# PowerShell
# 
# choco install <package_name> 
# choco upgrade all 
# 2. Using the Chocolatey Module:
# 
# For more advanced scenarios, you can use the official Chocolatey PowerShell module.
# 
# Install the module:
# 
# PowerShell
# 
# Install-Module Chocolatey
# Use the module's cmdlets:
# 
# PowerShell
# 
# Find-ChocolateyPackage <package_name>
# Install-ChocolateyPackage <package_name> 
# Update-ChocolateyPackage <package_name> 
# Example PowerShell Script (post_install.ps1):
# 
# PowerShell
# 
# # Install Chocolatey packages
# choco install googlechrome 
# choco install vscode 
# 
# # Update all installed packages
# choco upgrade all 
# 
# # Set-ExecutionPolicy Bypass -Scope Process 
# # This line temporarily bypasses the execution policy for the current script 
# # and is generally not recommended for production environments. 
# Important Notes:
# 
# Execution Policy: By default, PowerShell restricts the execution of scripts for security reasons. You might need to adjust the execution policy before running your script. However, be cautious when modifying the execution policy.   
# Error Handling: Implement proper error handling within your script to gracefully handle potential issues during package installation or updates.
# Testing: Thoroughly test your script in a safe environment before running it on a freshly installed system.
# By combining the power of PowerShell and Chocolatey, you can create robust and efficient post-installation scripts to automate your system setup.
# 
# 
# Sources and related content
# about_Scripts - PowerShell | Microsoft Learn
# 
# learn.microsoft.com
# 
# about_Execution_Policies - PowerShell - Microsoft Learn
# 
# learn.microsoft.com
# 
# 
# - And if I would like to include some AutoHotkey commands or scripts I would like to run from inside the PowerShell script, could that also be done?
# 
# You can indeed execute AutoHotkey scripts from within a PowerShell script. Here's how:
# 
# 1. Using the Start-Process cmdlet:
# 
# This is the most straightforward method.
# 
# PowerShell
# 
# Start-Process -FilePath "C:\Path\To\Your\AutoHotkeyScript.ahk" 
# Replace "C:\Path\To\Your\AutoHotkeyScript.ahk" with the actual path to your AutoHotkey script file.
# 2. Using the Run command within AutoHotkey:
# 
# If you need more control or want to pass arguments to the PowerShell script from within AutoHotkey, you can use the Run command within your AutoHotkey script to execute the PowerShell script.
# 
# In your AutoHotkey script:
# 
# AutoHotkey
# 
# Run, PowerShell.exe -File "C:\Path\To\Your\PowerShellScript.ps1" 
# Example PowerShell Script (post_install.ps1):
# 
# PowerShell
# 
# # Install Chocolatey packages
# choco install googlechrome 
# choco install vscode 
# 
# # Run AutoHotkey script
# Start-Process -FilePath "C:\Path\To\Your\AutoHotkeyScript.ahk" 
# Important Considerations:
# 
# Error Handling: Implement error handling within both your PowerShell and AutoHotkey scripts to gracefully handle potential issues during execution.
# Execution Policy: Ensure that the necessary execution policies are set correctly for both PowerShell and AutoHotkey scripts.
# Testing: Thoroughly test your scripts in a safe environment before running them on a freshly installed system.
# By combining PowerShell and AutoHotkey, you can create powerful and flexible automation solutions for your post-installation tasks.
# 
# I hope this comprehensive guide helps you effectively integrate AutoHotkey into your PowerShell scripts!


# ___Vundle_Windows
# You're absolutely right! My apologies, the process for installing Vundle on Windows is not identical to Linux.
# 
# Here's a more accurate guide for Windows:
# 
# 1. Install Git
# 
# Download and install Git for Windows from the official Git website: https://git-scm.com/
# Important: During the installation, choose "Use Git from Git Bash only" or similar options. This ensures compatibility with Vim's command-line interface.
# 
# 2. Install Vundle
# 
#     Download Vundle:
#         Download the latest version of Vundle from GitHub: https://github.com/VundleVim/Vundle.vim
#         Extract the contents of the downloaded archive to your ~/.vim/bundle/ directory.
#             On Windows, ~/.vim/ translates to %USERPROFILE%\vim\.
#             Create the ~/.vim/ directory if it doesn't exist.
# 
# Add Vundle to your vimrc:
# 
# Open your vimrc file in a text editor. This file is typically located at %USERPROFILE%\vim\_vimrc on Windows.
# 
# Add the following lines to your vimrc file:
# Vim Script
# 
# set nocompatible              " be iMproved, required
#         filetype plugin indent on     " required
# " set the runtime path to include Vundle
#         set rtp+=~/.vim/bundle/Vundle.vim
#         " required: let Vundle manage Vundle, required
# call vundle#begin()
# " All of your Plugins must be added before the following line
#         call vundle#end()            " required
# filetype plugin indent on     " required
# 
# 3. Install Plugins
# 
#     Add Plugins to your vimrc:
# 
#         Within the call vundle#begin() and call vundle#end() blocks in your vimrc, add lines like this for each plugin:
#         Vim Script
# 
#     Plugin 'tpope/vim-fugitive'      " Git wrapper
# Plugin 'vim-airline/vim-airline' " Statusline
#     Plugin 'scrooloose/nerdtree'    " File explorer
# 
# Install Plugins:
# 
# Open Vim.
# 
# Run the following commands in Vim:
# Vim Script
# 
# :PluginInstall
# 
# 4. Update Plugins
# 
# Update Plugins:
# 
# To update your plugins, run the following command in Vim:
# Vim Script
# 
# :PluginUpdate
# 
# 5. Troubleshooting
# 
# Check for Errors:
# If you encounter any errors, check the Vim message window for details.
# Search online for solutions to specific error messages.
# 
# Clear Cache:
# If you encounter issues with plugins not loading or behaving unexpectedly, try clearing the Vim cache (as described in the previous response).
# 
# I apologize for the incorrect information in my previous response. I am still under development and learning to be more accurate.


# ___vim-plug_Windows
# # For Unix-like systems (Linux, macOS, etc.):
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
# https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# 
# # For Windows (PowerShell):
# iwr -useb -outf $PROFILE\vim-plug.vim \
# https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# 
# 2.  Configuring your init.vim or vimrc:
# 
# Open your init.vim (usually ~/.config/nvim/init.vim for Neovim, or ~/.vimrc for Vim) and add the following block:
# Vim Script
# 
# call plug#begin('~/.vim/plugged') " Or any other directory you prefer
# 
# " List your plugins here
# Plug 'tpope/vim-fugitive'  " Example: Git integration
# Plug 'nvim-lua/popup.nvim' " Example: Neovim popup library (Neovim only)
# Plug 'neoclide/coc.nvim'   " Example: Completion framework
# 
# " ... more plugins ...
# 
# call plug#end() " This must come *after* your plugin list
# 
# " Optional: Add commands to re-source your init.vim after installing/updating
# " autocmd VimEnter * if !exists('g:loaded_plugins') | source $MYVIMRC | endif
# 
#     call plug#begin('~/.vim/plugged'): This starts the plugin management block. The argument is the directory where plugins will be installed. ~/.vim/plugged is a common choice.
#     Plug 'plugin-name': This is how you specify a plugin. The format is usually username/repository. You can also specify a branch, tag, or commit: Plug 'user/repo', { 'branch': 'develop' } or Plug 'user/repo', { 'tag': 'v1.0.0' }
#     call plug#end(): This marks the end of the plugin list. It's crucial to have this.
#     The optional autocmd helps with automatically sourcing your vimrc after installing plugins, so changes take effect immediately.
# 
# 3. Installing Plugins:
# 
# Inside Vim or Neovim, after saving your init.vim or vimrc with the plugin list, run the following command:
# Vim Script
# 
# :PlugInstall
# 
# This will download and install all the plugins listed between plug#begin() and plug#end().
# 
# 4. Other Useful Commands:
# 
#     PlugUpdate: Updates all plugins to their latest versions.
#     PlugClean: Removes plugins that are no longer listed in your init.vim.
#     PlugUpgrade: Upgrades vim-plug itself.
#     PlugStatus: Shows the status of your plugins.
# 
# 5.  Key Differences and Advantages over Vundle:
# 
#     Simpler Installation: No need to clone a separate repository for the plugin manager itself.
#     Faster: vim-plug is generally considered faster than Vundle, especially for installation and updates.
#     Single-file: The entire plugin manager is contained in a single file, making it easy to manage.
#     Direct Git Integration: vim-plug uses Git directly, so there's no intermediate layer.
#     Supports Branches/Tags/Commits: You can easily specify which version of a plugin to install.
#     Minimalistic: vim-plug focuses on core plugin management functionality without unnecessary extras.
# 
# 6. Making the Decision:
# 
# Now that you've seen how easy it is to set up and use vim-plug, the decision to switch is up to you.  If you value simplicity, speed, and direct Git integration, vim-plug is an excellent choice.  Try it out for a while and see if it fits your workflow better than Vundle.  If you're happy with Vundle and it's working well for you, there's no compulsion to switch.  However, many users have found vim-plug to be a more efficient and streamlined experience.


## Emacs Slime (+=SBCL)
# Quick question: If I wanted to be able to use Slime in Emacs (and particularly on Windows) I guess I would have to install Common Lisp (using something like QuickLisp). Could you give me some advice there, and particularly when it comes to if I could use Chocolatey or the like for any (or maybe even all) of the process?
# 
# You're on the right track!  Using Slime with Emacs on Windows does require a Common Lisp implementation, and Quicklisp is a great way to manage libraries. Chocolatey can indeed help streamline the process. Here's a breakdown of how you can approach this:
# 
# 1. Installing a Common Lisp Implementation:
# 
# Chocolatey: Yes, Chocolatey can be used! Several Common Lisp implementations are available as Chocolatey packages. The most common and recommended one is sbcl. You can install it like this:
# 
# <!-- end list -->
# PowerShell
# 
# choco install sbcl
# 
# This will install Steel Bank Common Lisp (SBCL), a high-performance and widely used implementation.
# 
# Manual Installation (Alternative): If, for some reason, you prefer not to use Chocolatey, you can download SBCL directly from their website (http://www.sbcl.org/) and install it manually. However, Chocolatey makes updates much easier.
# 
# 2. Setting up Quicklisp:
# 
# Quicklisp is typically installed within your chosen Lisp implementation.  Here's how to do it with SBCL (which is what I recommend you install via Chocolatey):
# 
#     Start SBCL:  After installing SBCL (via Chocolatey or manually), you should be able to start it from the command line.  Just type sbcl and press Enter.
# 
#     Install Quicklisp:  Inside the SBCL REPL (Read-Eval-Print Loop), paste the following code:
# 
# <!-- end list -->
# Lisp
# 
# (quicklisp-client:install)
# 
# This will download and install Quicklisp.  It will ask you where you want to install it.  The default location is usually fine.
# 
#     Adding Quicklisp to your Lisp initialization: You'll want Quicklisp to be available every time you start SBCL. Quicklisp provides instructions on how to add this to your init file. It will usually involve adding a line similar to this to your ~/.sbclrc file (create it if it doesn't exist):
# 
# <!-- end list -->
# Lisp
# 
# (load "path/to/quicklisp/setup.lisp")  ; Replace with the actual path
# 
# Quicklisp will tell you the appropriate path.  You can find your home directory using (user-homedir) inside the REPL.
# 
# 3. Installing Slime:
# 
# Slime itself is an Emacs package.  You can install it using your preferred Emacs package manager (e.g., package.el, use-package).  Here's a common approach using package.el:
# Code snippet
# 
# (require 'package)
# (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)  ; Add MELPA if you haven't already
# (package-initialize)
# (package-install 'slime)
# 
# 4. Configuring Slime:
# 
# You'll need to tell Slime where your Lisp implementation is.  Add the following to your Emacs initialization file (~/.emacs or ~/.emacs.d/init.el):
# Code snippet
# 
# (setq inferior-lisp-program "sbcl")  ; Or the path to your sbcl executable if needed
# 
# 5. Running Slime:
# 
# Start Emacs.  You can then start Slime by typing M-x slime.  Slime will then connect to your SBCL instance.
# 
# Chocolatey Summary:
# 
# Chocolatey simplifies the installation of SBCL.  The rest of the setup (Quicklisp and Slime) is typically done within the Lisp environment and Emacs, respectively.
# 
# Key Recommendations:
# 
# SBCL via Chocolatey: This is the easiest and most recommended way to get a Common Lisp implementation on Windows.
# Quicklisp: Essential for managing Lisp libraries.
# Package.el (or use-package): Use these for managing Emacs packages, including Slime.
# 
# If you run into any specific errors, please provide the error messages, and I'll do my best to help you troubleshoot.


### Getting Windows Accessible to WSL ----
### Restart WSL Service:
### 
### Open PowerShell as administrator and run: Restart-Service LxssManager
### 
### Shutdown and Restart WSL:
### 
### In PowerShell, run: wsl --shutdown
### Wait a few seconds, then open your WSL distribution again.
### 
### Check WSL Configuration:
### 
### Open your WSL distribution.
# Edit the /etc/wsl.conf file (create it if it doesn't exist): sudo nano /etc/wsl.conf
# 
# Add the following lines:
# Ini, TOML
# 
# [automount]
# root = /mnt/
# options = "metadata,umask=22,fmask=11"
# 
# Save the file and restart WSL.
#