
# ---------------------------------------------------------------------------------------------------------------------------------------------------------
$ConfigURLs = @{
	# My
	"URLMyRepository" = "https://github.com/TheMalwareGuardian/"
	"URLMyLinkedin" = "https://www.linkedin.com/in/vazquez-vazquez-alejandro/"
	# Bootkits Requirements
	"URLVisualStudio2019" = "https://download.visualstudio.microsoft.com/download/pr/7c09e2e8-2b3e-4213-93ab-5646874f8a2b/0ac797413a56c6b2772f48a567a32cdddd3b739f5b2af649fcf90be4245762ff/vs_Community.exe"
	"URLGit" = "https://github.com/git-for-windows/git/releases/download/v2.47.1.windows.1/Git-2.47.1-64-bit.exe"
	"URLPython39" = "https://www.python.org/ftp/python/3.9.0/python-3.9.0-amd64.exe"
	"URLNasm" = "https://www.nasm.us/pub/nasm/releasebuilds/2.16.03/win64/nasm-2.16.03-installer-x64.exe"
	"URLAsl" = "https://downloadmirror.intel.com/843401/iasl-win-20241212.zip"
	# Bootkits Setup
	"URLEdk2" = "https://github.com/tianocore/edk2"
	# Bootkits Tools
	"URLUefiTool" = "https://github.com/LongSoft/UEFITool/archive/refs/heads/new_engine.zip"
	"URLChipsec" = "https://github.com/chipsec/chipsec/archive/refs/heads/main.zip"
	"URLFwHunt" = "https://github.com/binarly-io/FwHunt/archive/refs/heads/main.zip"
	# Debugging Requirements
	"URLWinDbg" = "https://windbg.download.prss.microsoft.com/dbazure/prod/1-0-0/windbg.appinstaller"
	# Debugging Tools
	"URLSysinternalsSuite" = "https://download.sysinternals.com/files/SysinternalsSuite.zip"
	"URLProcessHacker" = "https://downloads.sourceforge.net/project/processhacker/processhacker2/processhacker-2.39-setup.exe?ts=gAAAAABmbxthJ3fbZBaH0Nz2UUj3n-SNQHkB9Pc1mWp7xeLO9U9iSa5ZsmTSUuY93Ii9f7yFk3WZWokudbkymG4pJFqe05Iduw==&use_mirror=altushost-swe&r=https://processhacker.sourceforge.io/"
	# Debugging Scripting
	"URLPykdWhl" = "https://files.pythonhosted.org/packages/12/2d/fabb94c8bdbfc1748da0f21867ed44eb12a6b016bfe87abe5872ba75d6a3/pykd-0.3.4.15-cp39-none-win_amd64.whl"
	"URLPykdDll" = "https://raw.githubusercontent.com/TheMalwareGuardian/WinDbg_Scripting/refs/heads/main/ScriptsHelloWorld/PyKd/pykd_ext_2.0.0.25/x64/pykd.dll"
	# Rootkits Requirements
	"URLVisualStudio2022" = "https://c2rsetup.officeapps.live.com/c2r/downloadVS.aspx?sku=community&channel=Release&version=VS2022&source=VSLandingPage&cid=2030:4ebb8042bddf497187f8b93fc1736d56"
	"URLSdk" = "https://download.microsoft.com/download/e/b/3/eb320eb1-b21e-4e6e-899e-d6aec552ecb0/KIT_BUNDLE_WINDOWSSDK_MEDIACREATION/winsdksetup.exe"
	"URLWdk" = "https://download.microsoft.com/download/a/0/4/a04a6ea0-d70d-496f-9949-a73e283be017/KIT_BUNDLE_WDK_MEDIACREATION/wdksetup.exe"
	"URLVisualStudioCode" = "https://vscode.download.prss.microsoft.com/dbazure/download/stable/33fc5a94a3f99ebe7087e8fe79fbe1d37a251016/VSCodeUserSetup-x64-1.97.0.exe"
	# Rootkits Tools
	"URLOsrLoader" = "https://www.osronline.com/OsrDown.cfm/osrloaderv30.zip"
	"URLGhydra" = "https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_11.3_build/ghidra_11.3_PUBLIC_20250205.zip"
	"URLIdaFree" = "https://out7.hex-rays.com/files/idafree84_windows.exe"
}

# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function Show-Menu {
	Clear-Host
	Write-Host "=============================================================================================="
	Write-Host "Overview:"
	Write-Host " - PowerShell Script for Automating Bootkits/Rootkits Development Environment Setup in Windows"
	Write-Host "Note:"
	Write-Host " - All options have been tested on the latest version of Windows 11 24H2"
	Write-Host "LinkedIn:"
	Write-Host " - $($ConfigURLs["URLMyLinkedin"])"
	Write-Host "Github:"
	Write-Host " - $($ConfigURLs["URLMyRepository"])"
	Write-Host "=============================================================================================="
	Write-Host ""
	Write-Host ""
	Write-Host "------------------------------------------- MENU ---------------------------------------------"
	Write-Host " BOOTKITS"
	Write-Host "	1a. Bootkits   - Requirements              -> Visual Studio 2019 Community + Git + Python + NASM + ASL"
	Write-Host "	1b. Bootkits   - Set Up Environment        -> EDK2"
	Write-Host "	1c. Bootkits   - Tools                     -> UEFI Scanners"
	Write-Host "	1d. Bootkits   - PoCs                      -> UEFI Applications + DXE Drivers"
	Write-Host ""
	Write-Host " DEBUGGING"
	Write-Host "	2a. Debugging  - Requirements              -> WinDbg"
	Write-Host "	2b. Debugging  - Set Up Environment        -> Enable Debugging"
	Write-Host "	2c. Debugging  - Tools                     -> Microsoft Sysinternals Suite + Process Hacker"
	Write-Host "	2d. Debugging  - Scripting                 -> PoCs - WinDbg Classic + JavaScript + Python PYKD + WinDbg Extensions"
	Write-Host "	2e. Debugging  - Debugging Diagram         -> Host (Debugger) + Target (Debugee)"
	Write-Host ""
	Write-Host " ROOTKITS"
	Write-Host "	3a. Rootkits   - Requirements              -> Visual Studio 2022 Community + SDK + WDK + Visual Studio Code"
	Write-Host "	3b. Rootkits   - Set Up Environment        -> Enable Test Mode + Disable Integrity Checks"
	Write-Host "	3c. Rootkits   - Tools                     -> OSR Driver Loader + Ghydra + IDA Free"
	Write-Host "	3d. Rootkits   - PoCs                      -> Kernel Mode Drivers & Console Applications"
	Write-Host ""
	Write-Host " RESOURCES"
	Write-Host "	4a. Resources  - My Repositories           -> A compilation of resources dedicated to bootkit and rootkit development"
	Write-Host ""
	Write-Host " PROGRAM TERMINATION"
	Write-Host "	Q. Exit"
	Write-Host "----------------------------------------------------------------------------------------------"
}

# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionBootkitsRequirements {
	Write-Host "You have selected the option 'Bootkits - Requirements -> Visual Studio 2019 Community + Git + Python + NASM + ASL'" -ForegroundColor Green
	$response = Read-Host "Do you want to proceed? (Press 'Y')"
	if ($response -eq "Y") {

		# Temp folder
		$folderTempBootkitsRequirementBinaries = "TemporalBootkitsRequirementBinaries"
		$folderTempBootkitsRequirementBinariesPath = Join-Path -Path $PWD -ChildPath $folderTempBootkitsRequirementBinaries
		if (-not (Test-Path -Path $folderTempBootkitsRequirementBinariesPath)) {
			New-Item -ItemType Directory -Path $folderTempBootkitsRequirementBinariesPath | Out-Null
		}

		# Visual Studio
		$install = Read-Host "Do you want to install Visual Studio 2019 Community? (Y/N)"
		if ($install -eq "Y") {
			Write-Host "Install Visual Studio 2019 Community:" -ForegroundColor Yellow
			Write-Host "1. Under the 'Workloads' section -> 'Desktop & Mobile', select 'Desktop development with C++'" -ForegroundColor Yellow
			Write-Host "2. Look for the 'Individual components' section located as the second option in the top left and select 'MSVC v142 - VS 2019 C++ x64/x86 Spectre-mitigated libs (latest)'" -ForegroundColor Yellow
			Write-Host "3. Install Visual Studio" -ForegroundColor Yellow

			$webClient = New-Object System.Net.WebClient
			$webClient.DownloadFile($ConfigURLs["URLVisualStudio2019"], "$folderTempBootkitsRequirementBinariesPath\vs_Community.exe")
			$process = Start-Process -FilePath "$folderTempBootkitsRequirementBinariesPath\vs_Community.exe" -PassThru
			$process.WaitForExit()
			while ($true) {
				$response = Read-Host "Installation completed? (Y/N)"
				if ($response -eq "Y") {
					break
				}
			}
			Write-Host "Installed - Visual Studio 2019 Community" -ForegroundColor Yellow
		}

		# Git
		$install = Read-Host "Do you want to install Git? (Y/N)"
		if ($install -eq "Y") {
			Write-Host "Install Git" -ForegroundColor Yellow

			$webClient = New-Object System.Net.WebClient
			$webClient.DownloadFile($ConfigURLs["URLGit"], "$folderTempBootkitsRequirementBinariesPath\git.exe")
			$process = Start-Process -FilePath "$folderTempBootkitsRequirementBinariesPath\git.exe" -PassThru
			$process.WaitForExit()
			while ($true) {
				$response = Read-Host "Installation completed? (Y/N)"
				if ($response -eq "Y") {
					break
				}
			}
			Write-Host "Installed - Git" -ForegroundColor Yellow
		}

		# Python
		$install = Read-Host "Do you want to install Python 3.9? (Y/N)"
		if ($install -eq "Y") {
			Write-Host "Install Python 3.9" -ForegroundColor Yellow

			$webClient = New-Object System.Net.WebClient
			$webClient.DownloadFile($ConfigURLs["URLPython39"], "$folderTempBootkitsRequirementBinariesPath\python39.exe")
			$process = Start-Process -FilePath "$folderTempBootkitsRequirementBinariesPath\python39.exe" -PassThru
			$process.WaitForExit()
			while ($true) {
				$response = Read-Host "Installation completed? (Y/N)"
				if ($response -eq "Y") {
					break
				}
			}
			Write-Host "Installed - Python 3.9" -ForegroundColor Yellow
		}

		# NASM
		$install = Read-Host "Do you want to install Netwide Assembler (NASM)? (Y/N)"
		if ($install -eq "Y") {
			Write-Host "Install NASM:" -ForegroundColor Yellow
			Write-Host "1. Install it in 'C:\nasm\'" -ForegroundColor Yellow

			$webClient = New-Object System.Net.WebClient
			$webClient.DownloadFile($ConfigURLs["URLNasm"], "$folderTempBootkitsRequirementBinariesPath\nasm.exe")
			$process = Start-Process -FilePath "$folderTempBootkitsRequirementBinariesPath\nasm.exe" -PassThru
			$process.WaitForExit()
			while ($true) {
				$response = Read-Host "Installation completed? (Y/N)"
				if ($response -eq "Y") {
					break
				}
			}
			Invoke-Expression -Command "set NASM_PREFIX=C:\nasm\"
			Write-Host "Installed - Netwide Assembler (NASM)" -ForegroundColor Yellow
		}

		# ASL
		$install = Read-Host "Do you want to install ACPI Source Language (ASL) Compiler? (Y/N)"
		if ($install -eq "Y") {
			Write-Host "Install iASL Compiler and Windows ACPI Tools" -ForegroundColor Yellow

			$webClient = New-Object System.Net.WebClient
			$webClient.DownloadFile($ConfigURLs["URLAsl"], "$folderTempBootkitsRequirementBinariesPath\iasl-win.zip")
			Expand-Archive -Path "$folderTempBootkitsRequirementBinariesPath\iasl-win.zip" -DestinationPath "C:\ASL"
			Write-Host "Installed - iASL Compiler and Windows ACPI Tools" -ForegroundColor Yellow
		}

		Remove-Item $folderTempBootkitsRequirementBinariesPath -Recurse
	}
	Write-Host "Please restart the computer" -ForegroundColor Magenta
}

# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionBootkitsSetUp {

	Write-Host "You have selected the option 'Bootkits - Set Up Environment -> EDK2'" -ForegroundColor Green
	$response = Read-Host "Do you want to proceed? (Press 'Y')"
	if ($response -eq "Y") {

		# ABR_Bootkits_SetUp
		$folderBootkitsSetUp = "ABR_Bootkits_SetUp"
		$folderBootkitsSetUpPath = Join-Path -Path $PWD -ChildPath $folderBootkitsSetUp

		if (-not (Test-Path -Path $folderBootkitsSetUpPath)) {
			New-Item -ItemType Directory -Path $folderBootkitsSetUpPath | Out-Null
			Write-Host "Created folder: $folderBootkitsSetUpPath" -ForegroundColor Yellow

			# EDK2
			$install = Read-Host "Do you want to download and configure EDK2? (Y/N)"
			if ($install -eq "Y") {
				Write-Host "Install EDK2" -ForegroundColor Yellow

				$folderBack = $PWD
				Invoke-Expression -Command "git clone --recurse-submodules $($ConfigURLs["URLEdk2"]) $folderBootkitsSetUpPath/edk2"
				Set-Location -Path "$folderBootkitsSetUpPath\edk2"

				Start-Process cmd.exe -ArgumentList "/c edksetup.bat Rebuild" -Wait

				$filePath = "Conf/target.txt"
				$lines = Get-Content $filePath
				$lines = $lines -replace '^TARGET_ARCH .+ = .+', 'TARGET_ARCH = X64'
				$lines = $lines -replace '^TOOL_CHAIN_TAG .+ = .+', 'TOOL_CHAIN_TAG = VS2019'
				$lines = $lines -replace '^ACTIVE_PLATFORM .+ = .+', 'ACTIVE_PLATFORM = MdeModulePkg/MdeModulePkg.dsc'
				$lines | Set-Content $filePath

				Start-Process cmd.exe -ArgumentList "/c edksetup.bat Rebuild && build" -Wait

				Write-Host "A sample build has been executed using 'edksetup.bat Rebuild' and 'build' commands in a cmd window." -ForegroundColor Yellow
				Set-Location -Path "$folderBack"
			}

		} else {
			Write-Host "The folder '$folderBootkitsSetUpPath' already exists in this directory. Unable to proceed." -ForegroundColor Red
		}
	}
}

# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionBootkitsTools {

	Write-Host "You have selected the option 'Bootkits - Tools -> UEFI Scanners'" -ForegroundColor Green
	$response = Read-Host "Do you want to proceed? (Press 'Y')"
	if ($response -eq "Y") {

		# ABR_Bootkits_Tools
		$folderBootkitsTools = "ABR_Bootkits_Tools"
		$folderBootkitsToolsPath = Join-Path -Path $PWD -ChildPath $folderBootkitsTools

		if (-not (Test-Path -Path $folderBootkitsToolsPath)) {
			New-Item -ItemType Directory -Path $folderBootkitsToolsPath | Out-Null
			Write-Host "Created folder: $folderBootkitsTools" -ForegroundColor Yellow
		} else {
			Write-Host "The folder '$folderBootkitsToolsPath' already exists in this directory. Proceeding with downloads." -ForegroundColor Red
		}

		# UEFITool
		if (-not (Test-Path -Path "$folderBootkitsToolsPath\UEFITool")) {

			$webClient = New-Object System.Net.WebClient
			$webClient.DownloadFile($ConfigURLs["URLUefiTool"], "$folderBootkitsToolsPath\new_engine.zip")
			Expand-Archive -Path "$folderBootkitsToolsPath\new_engine.zip" -DestinationPath "$folderBootkitsToolsPath\UEFITool"
			Remove-Item "$folderBootkitsToolsPath\new_engine.zip"
			Write-Host "Downloaded - UEFITool" -ForegroundColor Yellow
			
		} else {
			Write-Host "The folder '$folderBootkitsToolsPath\UEFITool' already exists in this directory. Unable to proceed." -ForegroundColor Red
		}

		# Chipsec
		if (-not (Test-Path -Path "$folderBootkitsToolsPath\Chipsec")) {

			$webClient = New-Object System.Net.WebClient
			$webClient.DownloadFile($ConfigURLs["URLChipsec"], "$folderBootkitsToolsPath\main.zip")
			Expand-Archive -Path "$folderBootkitsToolsPath\main.zip" -DestinationPath "$folderBootkitsToolsPath\Chipsec"
			Remove-Item "$folderBootkitsToolsPath\main.zip"
			Write-Host "Downloaded - Chipsec" -ForegroundColor Yellow

		} else {
			Write-Host "The folder '$folderBootkitsToolsPath\Chipsec' already exists in this directory. Unable to proceed." -ForegroundColor Red
		}

		# FwHunt
		if (-not (Test-Path -Path "$folderBootkitsToolsPath\FwHunt")) {

			$webClient = New-Object System.Net.WebClient
			$webClient.DownloadFile($ConfigURLs["URLFwHunt"], "$folderBootkitsToolsPath\main.zip")
			Expand-Archive -Path "$folderBootkitsToolsPath\main.zip" -DestinationPath "$folderBootkitsToolsPath\FwHunt"
			Remove-Item "$folderBootkitsToolsPath\main.zip"
			Write-Host "Downloaded - FwHunt" -ForegroundColor Yellow

		} else {
			Write-Host "The folder '$folderBootkitsToolsPath\FwHunt' already exists in this directory. Unable to proceed." -ForegroundColor Red
		}
	}
}

# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionBootkitsPoCs {

	Write-Host "You have selected the option 'Bootkits - PoCs -> UEFI Applications + DXE Drivers'" -ForegroundColor Green
	$response = Read-Host "Do you want to proceed? (Press 'Y')"
	if ($response -eq "Y") {

		# ABR_Bootkits_PoCs
		$folderBootkitsPoCs = "ABR_Bootkits_PoCs"
		$folderBootkitsPoCsPath = Join-Path -Path $PWD -ChildPath $folderBootkitsPoCs

		if (-not (Test-Path -Path $folderBootkitsPoCsPath)) {
			New-Item -ItemType Directory -Path $folderBootkitsPoCsPath | Out-Null
			Write-Host "Created folder: $folderBootkitsPoCs" -ForegroundColor Yellow
		}

		# Hello World
		$folderHelloWorld = "UEFI_Application_Hello_World"
		$folderHelloWorldPath = Join-Path -Path $folderBootkitsPoCsPath -ChildPath $folderHelloWorld
		if (-not (Test-Path -Path $folderHelloWorldPath)) {
			New-Item -ItemType Directory -Path $folderHelloWorldPath | Out-Null
		}

		$contentHelloWorldC = "LyoqIEBmaWxlCiAgQnJpZWYgRGVzY3JpcHRpb24gb2YgVUVGSSBNeUhlbGxvV29ybGQKICBEZXRhaWxlZCBEZXNjcmlwdGlvbiBvZiBVRUZJIE15SGVsbG9Xb3JsZAogIENvcHlyaWdodCBmb3IgVUVGSSBNeUhlbGxvV29ybGQKICBMaWNlbnNlIGZvciBVRUZJIE15SGVsbG9Xb3JsZAoqKi8KCiNpbmNsdWRlIDxVZWZpLmg+CiNpbmNsdWRlIDxMaWJyYXJ5L1VlZmlBcHBsaWNhdGlvbkVudHJ5UG9pbnQuaD4KI2luY2x1ZGUgPExpYnJhcnkvVWVmaUxpYi5oPgoKLyoqCiAgYXMgdGhlIHJlYWwgZW50cnkgcG9pbnQgZm9yIHRoZSBhcHBsaWNhdGlvbi4KCiAgQHBhcmFtW2luXSBJbWFnZUhhbmRsZSAgICBUaGUgZmlybXdhcmUgYWxsb2NhdGVkIGhhbmRsZSBmb3IgdGhlIEVGSSBpbWFnZS4gIAogIEBwYXJhbVtpbl0gU3lzdGVtVGFibGUgICAgQSBwb2ludGVyIHRvIHRoZSBFRkkgU3lzdGVtIFRhYmxlLgogIAogIEByZXR2YWwgRUZJX1NVQ0NFU1MgICAgICAgVGhlIGVudHJ5IHBvaW50IGlzIGV4ZWN1dGVkIHN1Y2Nlc3NmdWxseS4KICBAcmV0dmFsIG90aGVyICAgICAgICAgICAgIFNvbWUgZXJyb3Igb2NjdXJzIHdoZW4gZXhlY3V0aW5nIHRoaXMgZW50cnkgcG9pbnQuCgoqKi8KRUZJX1NUQVRVUwpFRklBUEkKVWVmaU1haW4gKAogIElOIEVGSV9IQU5ETEUgICAgICAgIEltYWdlSGFuZGxlLAogIElOIEVGSV9TWVNURU1fVEFCTEUgICpTeXN0ZW1UYWJsZQogICkKewogIFByaW50KEwiSGVsbG8gV29ybGQgXG4iKTsgCiAgcmV0dXJuIEVGSV9TVUNDRVNTOwp9"
		$contentHelloWorldCBytes = [System.Convert]::FromBase64String($contentHelloWorldC)
		[System.IO.File]::WriteAllBytes("$folderHelloWorldPath\UEFI_Application_Hello_World.c", $contentHelloWorldCBytes)

		$contentHelloWorldInf = "IyMgQGZpbGUKIyAgQnJpZWYgRGVzY3JpcHRpb24gb2YgVUVGSSBNeUhlbGxvV29ybGQKIyAgCiMgIERldGFpbGVkIERlc2NyaXB0aW9uIG9mIFVFRkkgTXlXaXphcmREcml2ZXIKIwojICBDb3B5cmlnaHQgZm9yIFVFRkkgIE15SGVsbG9Xb3JsZAojICAKIyAgTGljZW5zZSBmb3IgVUVGSSAgTXlIZWxsb1dvcmxkCiMgIAojIwoKW0RlZmluZXNdCiAgSU5GX1ZFUlNJT04gICAgICAgICAgICAgICAgICAgID0gMS4yNQogIEJBU0VfTkFNRSAgICAgICAgICAgICAgICAgICAgICA9IE15SGVsbG9Xb3JsZAogIEZJTEVfR1VJRCAgICAgICAgICAgICAgICAgICAgICA9ICNDb3B5IGFuZCBwYXN0ZSB0aGUgR1VJRCBmcm9tIGh0dHA6Ly93d3cuZ3VpZGdlbi5jb20vIGhlcmUKICBNT0RVTEVfVFlQRSAgICAgICAgICAgICAgICAgICAgPSBVRUZJX0FQUExJQ0FUSU9OCiAgVkVSU0lPTl9TVFJJTkcgICAgICAgICAgICAgICAgID0gMS4wCiAgRU5UUllfUE9JTlQgICAgICAgICAgICAgICAgICAgID0gVWVmaU1haW4KIwojIFRoZSBmb2xsb3dpbmcgaW5mb3JtYXRpb24gaXMgZm9yIHJlZmVyZW5jZSBvbmx5IGFuZCBub3QgcmVxdWlyZWQgYnkgdGhlIGJ1aWxkIHRvb2xzLgojCiMgIFZBTElEX0FSQ0hJVEVDVFVSRVMgICAgICAgICAgID0gSUEzMiBYNjQgSVBGIEVCQyBFdGMuLi4KIwoKW1NvdXJjZXNdCiAgTXlIZWxsb1dvcmxkLmMKCltQYWNrYWdlc10KICBNZGVQa2cvTWRlUGtnLmRlYwogIApbTGlicmFyeUNsYXNzZXNdCiAgVWVmaUFwcGxpY2F0aW9uRW50cnlQb2ludAogIFVlZmlMaWIKICAKW0d1aWRzXQoKW1BwaXNdCgpbUHJvdG9jb2xzXQoKW0ZlYXR1cmVQY2RdCgpbUGNkXQo="
		$contentHelloWorldInfBytes = [System.Convert]::FromBase64String($contentHelloWorldInf)
		[System.IO.File]::WriteAllBytes("$folderHelloWorldPath\UEFI_Application_Hello_World.inf", $contentHelloWorldInfBytes)

		Write-Host "Created - UEFI Application (Hello World)" -ForegroundColor Yellow
	}
}

# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionDebuggingRequirements {

	Write-Host "You have selected the option 'Debugging - Requirements -> WinDbg'" -ForegroundColor Green
	$response = Read-Host "Do you want to proceed? (Press 'Y')"
	if ($response -eq "Y") {

		# Temp folder
		$folderTempDebuggingRequirementBinaries = "TemporalDebuggingRequirementBinaries"
		$folderTempDebuggingRequirementBinariesPath = Join-Path -Path $PWD -ChildPath $folderTempDebuggingRequirementBinaries
		if (-not (Test-Path -Path $folderTempDebuggingRequirementBinariesPath)) {
			New-Item -ItemType Directory -Path $folderTempDebuggingRequirementBinariesPath | Out-Null
		}

		# WinDbg
		$install = Read-Host "Do you want to install WinDbg? (Y/N)"
		if ($install -eq "Y") {
			Write-Host "Install WinDbg" -ForegroundColor Yellow

			$webClient = New-Object System.Net.WebClient
			$webClient.DownloadFile($ConfigURLs["URLWinDbg"], "$folderTempDebuggingRequirementBinariesPath\windbg.appinstaller")
			Add-AppxPackage -AppInstallerFile "$folderTempDebuggingRequirementBinariesPath\windbg.appinstaller"
			Write-Host "Installed - WinDbg" -ForegroundColor Yellow
		}

		Remove-Item $folderTempDebuggingRequirementBinariesPath -Recurse
	}
}

# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionDebuggingSetUp {

	# Administrator
	function Test-Administrator {
		$currentUser = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
		return $currentUser.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
	}

	Write-Host "You have selected the option 'Debugging - Set Up Environment -> Enable Debugging'" -ForegroundColor Green
	$response = Read-Host "Do you want to proceed? (Press 'Y')"
	if ($response -eq "Y") {

		if (Test-Administrator) {

			# Debugging
			$install = Read-Host "Do you want to enable debugging? (Y/N)"
			if ($install -eq "Y") {
				Invoke-Expression -Command "bcdedit -debug on"
				Write-Host "Enabled - Debugging" -ForegroundColor Yellow
				Write-Host "Please restart the computer" -ForegroundColor Magenta
			}
		
		} else {
			Write-Host "This script option must be run as an administrator." -ForegroundColor Red
		}
	}
}

# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionDebuggingTools {

	Write-Host "You have selected the option 'Debugging - Tools -> Microsoft Sysinternals Suite + Process Hacker'" -ForegroundColor Green
	$response = Read-Host "Do you want to proceed? (Press 'Y')"
	if ($response -eq "Y") {

		# Temp folder
		$folderTempDebuggingToolsBinaries = "TemporalDebuggingToolsBinaries"
		$folderTempDebuggingToolsBinariesPath = Join-Path -Path $PWD -ChildPath $folderTempDebuggingToolsBinaries
		if (-not (Test-Path -Path $folderTempDebuggingToolsBinariesPath)) {
			New-Item -ItemType Directory -Path $folderTempDebuggingToolsBinariesPath | Out-Null
		}

		# ABR_Debugging_Tools
		$folderDebuggingTools = "ABR_Debugging_Tools"
		$folderDebuggingToolsPath = Join-Path -Path $PWD -ChildPath $folderDebuggingTools

		if (-not (Test-Path -Path $folderDebuggingToolsPath)) {
			New-Item -ItemType Directory -Path $folderDebuggingToolsPath | Out-Null
			Write-Host "Created folder: $folderDebuggingTools" -ForegroundColor Yellow
		} else {
			Write-Host "The folder '$folderDebuggingToolsPath' already exists in this directory. Proceeding with downloads." -ForegroundColor Red
		}

		# Microsoft Sysinternals Suite
		$install = Read-Host "Do you want to download Microsoft Sysinternals Suite Tools? (Y/N)"
		if ($install -eq "Y") {
			if (-not (Test-Path -Path $folderDebuggingToolsPath\SysinternalsSuite)) {

				$webClient = New-Object System.Net.WebClient
				$webClient.DownloadFile($ConfigURLs["URLSysinternalsSuite"], "$folderDebuggingToolsPath\SysinternalsSuite.zip")
				Expand-Archive -Path $folderDebuggingToolsPath\SysinternalsSuite.zip -DestinationPath $folderDebuggingToolsPath\SysinternalsSuite
				Remove-Item $folderDebuggingToolsPath\SysinternalsSuite.zip
				Write-Host "Downloaded - Microsoft Sysinternals Suite" -ForegroundColor Yellow

			} else {
				Write-Host "The folder '$folderDebuggingToolsPath\SysinternalsSuite' already exists in this directory. Unable to proceed." -ForegroundColor Red
			}
		}

		# Process Hacker
		$install = Read-Host "Do you want to install Process Hacker? (Y/N)"
		if ($install -eq "Y") {
			Write-Host "Install Process Hacker" -ForegroundColor Yellow

			$webClient = New-Object System.Net.WebClient
			$webClient.DownloadFile($ConfigURLs["URLProcessHacker"], "$folderTempDebuggingToolsBinariesPath\processhacker-2.39-setup.exe")
			$process = Start-Process -FilePath "$folderTempDebuggingToolsBinariesPath\processhacker-2.39-setup.exe" -PassThru
			$process.WaitForExit()
			while ($true) {
				$response = Read-Host "Installation completed? (Y/N)"
				if ($response -eq "Y") {
					break
				}
			}
			Write-Host "Installed - Process Hacker" -ForegroundColor Yellow
		}

		Remove-Item $folderTempDebuggingToolsBinariesPath -Recurse
	}
}

# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionDebuggingScripting {

	Write-Host "You have selected the option 'Debugging - Scripting -> PoCs - WinDbg Classic + JavaScript + Python PYKD + WinDbg Extensions'" -ForegroundColor Green
	$response = Read-Host "Do you want to proceed? (Press 'Y')"
	if ($response -eq "Y") {

		# ABR_Debugging_Scripting
		$folderDebuggingScripting = "ABR_Debugging_Scripting"
		$folderDebuggingScriptingPath = Join-Path -Path $PWD -ChildPath $folderDebuggingScripting

		if (-not (Test-Path -Path $folderDebuggingScriptingPath)) {
			New-Item -ItemType Directory -Path $folderDebuggingScriptingPath | Out-Null
			Write-Host "Created folder: $folderDebuggingScripting" -ForegroundColor Yellow
		} else {
			Write-Host "The folder '$folderDebuggingScriptingPath' already exists in this directory." -ForegroundColor Red
		}

		# Classic
		$folderWinDbgClassic = "WinDbg_Classic"
		$folderWinDbgClassicPath = Join-Path -Path $folderDebuggingScriptingPath -ChildPath $folderWinDbgClassic
		if (-not (Test-Path -Path $folderWinDbgClassicPath)) {
			New-Item -ItemType Directory -Path $folderWinDbgClassicPath | Out-Null
		}

		$contentWinDbgClassicHelloWorld = "LmJsb2NrCnsKCS5wcmludGYgIkhlbGxvIFdvcmxkIVxuIgp9"
		$contentWinDbgClassicHelloWorldBytes = [System.Convert]::FromBase64String($contentWinDbgClassicHelloWorld)
		[System.IO.File]::WriteAllBytes("$folderWinDbgClassicPath\Hello_World_WinDbg_Classic.wds", $contentWinDbgClassicHelloWorldBytes)

		$contentWinDbgClassicHelloWorldRun = "a2Q+ICQkIEhlbGxvIFdvcmxkIHNjcmlwdDsgLmJsb2NrIHsgLnByaW50ZiAiSGVsbG8gV29ybGQhXG4iIH0Ka2Q+ICQkPjxDOlxNYWx3YXJlXEhlbGxvX1dvcmxkX1dpbkRiZ19DbGFzc2ljLndkcw=="
		$contentWinDbgClassicHelloWorldRunBytes = [System.Convert]::FromBase64String($contentWinDbgClassicHelloWorldRun)
		[System.IO.File]::WriteAllBytes("$folderWinDbgClassicPath\Hello_World_WinDbg_Classic_Run.txt", $contentWinDbgClassicHelloWorldRunBytes)

		Write-Host "Created - WinDbg Classic (Scripts)" -ForegroundColor Yellow

		# JavaScript
		$folderWinDbgJavaScript = "WinDbg_JavaScript"
		$folderWinDbgJavaScriptPath = Join-Path -Path $folderDebuggingScriptingPath -ChildPath $folderWinDbgJavaScript
		if (-not (Test-Path -Path $folderWinDbgJavaScriptPath)) {
			New-Item -ItemType Directory -Path $folderWinDbgJavaScriptPath | Out-Null
		}

		$contentWinDbgJavaScriptHelloWorld = "Ly8gV2luRGJnIEphdmFTY3JpcHQgc2FtcGxlCi8vIFNheXMgSGVsbG8gV29ybGQhCgovLyBDb2RlIGF0IHJvb3Qgd2lsbCBiZSBydW4gd2l0aCAuc2NyaXB0cnVuIGFuZCAuc2NyaXB0bG9hZApob3N0LmRpYWdub3N0aWNzLmRlYnVnTG9nKCIqKio+IEhlbGxvIFdvcmxkISBcbiIpOwoKZnVuY3Rpb24gc2F5SGkoKQp7CgkvL1NheSBIaSAKCWhvc3QuZGlhZ25vc3RpY3MuZGVidWdMb2coIkhpIGZyb20gSmF2YVNjcmlwdCEgXG4iKTsKfQ=="
		$contentWinDbgJavaScriptHelloWorldBytes = [System.Convert]::FromBase64String($contentWinDbgJavaScriptHelloWorld)
		[System.IO.File]::WriteAllBytes("$folderWinDbgJavaScriptPath\Hello_World_WinDbg_JavaScript.js", $contentWinDbgJavaScriptHelloWorldBytes)

		$contentWinDbgJavaScriptHelloWorldRun = "a2Q+IC5zY3JpcHRsb2FkIEM6XE1hbHdhcmVcSGVsbG9fV29ybGRfV2luRGJnX0phdmFTY3JpcHQuanMKa2Q+IGR4IERlYnVnZ2VyLlN0YXRlLlNjcmlwdHMuSGVsbG9fV29ybGRfV2luRGJnX0phdmFTY3JpcHQuQ29udGVudHMuc2F5SGkoKQprZD4gLnNjcmlwdHJ1biBDOlxNYWx3YXJlXEhlbGxvX1dvcmxkX1dpbkRiZ19KYXZhU2NyaXB0LmpzCmtkPiAuc2NyaXB0dW5sb2FkIEM6XE1hbHdhcmVcSGVsbG9fV29ybGRfV2luRGJnX0phdmFTY3JpcHQuanM="
		$contentWinDbgJavaScriptHelloWorldRunBytes = [System.Convert]::FromBase64String($contentWinDbgJavaScriptHelloWorldRun)
		[System.IO.File]::WriteAllBytes("$folderWinDbgJavaScriptPath\Hello_World_WinDbg_JavaScript_Run.txt", $contentWinDbgJavaScriptHelloWorldRunBytes)

		Write-Host "Created - WinDbg JavaScript (Scripts)" -ForegroundColor Yellow

		# Python
		$folderWinDbgPython = "WinDbg_Python"
		$folderWinDbgPythonPath = Join-Path -Path $folderDebuggingScriptingPath -ChildPath $folderWinDbgPython
		if (-not (Test-Path -Path $folderWinDbgPythonPath)) {
			New-Item -ItemType Directory -Path $folderWinDbgPythonPath | Out-Null
		}

		$contentWinDbgPykdHelloWorld = "aW1wb3J0IHB5a2QKCmRlZiBtYWluKCk6CgkjIFByaW50ICJIZWxsbyBXb3JsZCIgdG8gdGhlIFB5dGhvbiBjb25zb2xlCglwcmludCgiSGVsbG8gV29ybGQiKQoJCgkjIEV4ZWN1dGUgdGhlIFdpbkRiZyBjb21tYW5kICFwcm9jZXNzIDAgMCBhbmQgZ2V0IHRoZSBvdXRwdXQKCXJlc3VsdCA9IHB5a2QuZGJnQ29tbWFuZCgiIXByb2Nlc3MgMCAwIikKCQoJIyBQcmludCB0aGUgcmVzdWx0IG9mIHRoZSBjb21tYW5kIHRvIHRoZSBQeXRob24gY29uc29sZQoJcHJpbnQocmVzdWx0KQoKaWYgX19uYW1lX18gPT0gIl9fbWFpbl9fIjoKCW1haW4oKQ=="
		$contentWinDbgPykdHelloWorldBytes = [System.Convert]::FromBase64String($contentWinDbgPykdHelloWorld)
		[System.IO.File]::WriteAllBytes("$folderWinDbgPythonPath\Hello_World_WinDbg_Pykd.py", $contentWinDbgPykdHelloWorldBytes)

		$contentWinDbgPykdHelloWorldRun = "a2Q+IC5sb2FkIEM6XE1hbHdhcmVccHlrZC5kbGwKa2Q+ICFwaXAgaW5zdGFsbCBDOlxNYWx3YXJlXHB5a2QtMC4zLjQuMTUtY3AzOS1ub25lLXdpbl9hbWQ2NC53aGwKa2Q+ICFweQo+Pj4gaW1wb3J0IHB5a2QKPj4+IHByaW50KHB5a2QuZGJnQ29tbWFuZCgidmVyc2lvbiIpKQo+Pj4gZXhpdCgpCmtkPiAhcHkgQzpcTWFsd2FyZVxIZWxsb19Xb3JsZF9XaW5EYmdfUHlrZC5weQ=="
		$contentWinDbgPykdHelloWorldRunBytes = [System.Convert]::FromBase64String($contentWinDbgPykdHelloWorldRun)
		[System.IO.File]::WriteAllBytes("$folderWinDbgPythonPath\Hello_World_WinDbg_Pykd_Run.txt", $contentWinDbgPykdHelloWorldRunBytes)

		# Python - pykd-0.3.4.15-cp39-none-win_amd64.whl
		$webclient = New-Object System.Net.WebClient
		$webclient.DownloadFile($ConfigURLs["URLPykdWhl"], "$folderWinDbgPythonPath\pykd-0.3.4.15-cp39-none-win_amd64.whl")

		# Python - pykd.dll
		$webClient = New-Object System.Net.WebClient
		$webClient.DownloadFile($ConfigURLs["URLPykdDll"], "$folderWinDbgPythonPath\pykd.dll")

		Write-Host "Created - WinDbg Python (Scripts)" -ForegroundColor Yellow
	}
}

# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionDebuggingDiagram {

	Write-Host "You have selected the option 'Debugging - Debugging Diagram -> Host (Debugger) + Target (Debugee)'" -ForegroundColor Green
	$response = Read-Host "Do you want to proceed? (Press 'Y')"
	if ($response -eq "Y") {

		Write-Host " "
		Write-Host "                +-----------------------------+ In remote debugging, the host machine is referred to as the Debugger" -ForegroundColor Cyan
		Write-Host "                | HOST                        | " -ForegroundColor Cyan
		Write-Host "                |  * Running WinDbg           | " -ForegroundColor Cyan
		Write-Host "                +-----------------------------+ " -ForegroundColor Cyan
		Write-Host "  192.168.1.21                 | " -ForegroundColor Cyan
		Write-Host "        |                      | " -ForegroundColor Cyan
		Write-Host "        |                      | 1 Copy kdnet.exe and VerifiedNICList.xml from Host (C:\Program Files (x86)\Windows Kits\10\Debuggers\x64\) to Target (C:\KDNET)" -ForegroundColor Yellow
		Write-Host "        |                      | " -ForegroundColor Cyan
		Write-Host "        |                      | " -ForegroundColor Cyan
		Write-Host "        |                      | 3 ping 192.168.1.56" -ForegroundColor Yellow
		Write-Host "        |                      | " -ForegroundColor Cyan
		Write-Host "        |                      | " -ForegroundColor Cyan
		Write-Host "        |                      | 5 windbg -k net:port=50000,key=9120t4srcwo0.3oa3xyi7ox8vz.31arkt33l3rqj.2mf33k8l6j7t6" -ForegroundColor Yellow
		Write-Host "        |                      | " -ForegroundColor Cyan
		Write-Host "        |                      | " -ForegroundColor Cyan
		Write-Host "    +-----------------------------------------------------+ " -ForegroundColor Cyan
		Write-Host "    |                       NETWORK                       | " -ForegroundColor Cyan
		Write-Host "    |                    192.168.1.0/24                   | " -ForegroundColor Cyan
		Write-Host "    +-----------------------------------------------------+ " -ForegroundColor Cyan
		Write-Host "        |                      | " -ForegroundColor Cyan
		Write-Host "        |                      | " -ForegroundColor Cyan
		Write-Host "        |                      | 2 [Firewall Allow] (ICMP, TCP: 50000-50039)" -ForegroundColor Yellow
		Write-Host "        |                      |     New-NetFirewallRule -DisplayName 'Allow ICMP' -Direction Inbound -Protocol ICMPv4 -Action Allow" -ForegroundColor Yellow
		Write-Host "        |                      |     New-NetFirewallRule -DisplayName 'Allow WinDbg TCP' -Direction Inbound -Protocol TCP -LocalPort 50000-50039 -Action Allow" -ForegroundColor Yellow
		Write-Host "        |                      | " -ForegroundColor Cyan
		Write-Host "        |                      | " -ForegroundColor Cyan
		Write-Host "        |                      | 4 kdnet.exe 192.168.1.21 50000" -ForegroundColor Yellow
		Write-Host "        |                      | " -ForegroundColor Cyan
		Write-Host "        |                      | " -ForegroundColor Cyan
		Write-Host "        |                      | 6 shutdown -r -t 0" -ForegroundColor Yellow
		Write-Host "        |                      | " -ForegroundColor Cyan
		Write-Host "  192.168.1.56                 | " -ForegroundColor Cyan
		Write-Host "                +-----------------------------+ In remote debugging, the target machine is referred to as the Debugee" -ForegroundColor Cyan
		Write-Host "                | TARGET                      | " -ForegroundColor Cyan
		Write-Host "                |  * Running Debugged OS      | " -ForegroundColor Cyan
		Write-Host "                |  * Using KDNET for Debug    | " -ForegroundColor Cyan
		Write-Host "                +-----------------------------+ " -ForegroundColor Cyan
		Write-Host ""
		Write-Host ""
		Write-Host " [Microsoft Learn / Windows / Windows Drivers] Set up KDNET network kernel debugging automatically:" -ForegroundColor Yellow
		Write-Host "     - Ensure both computers are connected via network."
		Write-Host "     - On the HOST, locate KDNET files:"
		Write-Host "        C:\Program Files (x86)\Windows Kits\10\Debuggers\x64\kdnet.exe"
		Write-Host "        C:\Program Files (x86)\Windows Kits\10\Debuggers\x64\VerifiedNICList.xml"
		Write-Host "     - Copy both files to a network share or USB."
		Write-Host "     - On the TARGET, create the directory:"
		Write-Host "        C:\KDNET"
		Write-Host "     - Copy kdnet.exe and VerifiedNICList.xml to C:\KDNET"
		Write-Host "     - Run 'kdnet.exe <HostIP> <Port>' on the Target machine."
		Write-Host "     - Copy and save the generated Debug Key."
		Write-Host "     - Start WinDbg on the Host with:"
		Write-Host "        windbg -k net:port=<Port>,key=<Key>"
		Write-Host "     - Restart the Target machine to start debugging."

	}
}

# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionRootkitsRequirements {

	Write-Host "You have selected the option 'Rootkits - Requirements -> Visual Studio 2022 Community + SDK + WDK + Visual Studio Code'" -ForegroundColor Green
	$response = Read-Host "Do you want to proceed? (Press 'Y')"
	if ($response -eq "Y") {

		# Temp folder
		$folderTempRootkitsRequirementBinaries = "TemporalRootkitsRequirementBinaries"
		$folderTempRootkitsRequirementBinariesPath = Join-Path -Path $PWD -ChildPath $folderTempRootkitsRequirementBinaries
		if (-not (Test-Path -Path $folderTempRootkitsRequirementBinariesPath)) {
			New-Item -ItemType Directory -Path $folderTempRootkitsRequirementBinariesPath | Out-Null
		}

		# Visual Studio
		$install = Read-Host "Do you want to install Visual Studio 2022 Community? (Y/N)"
		if ($install -eq "Y") {
			Write-Host "Install Visual Studio 2022 Community:" -ForegroundColor Yellow
			Write-Host "  1. Under the 'Workloads' section -> 'Desktop & Mobile', select 'Desktop development with C++'." -ForegroundColor Yellow
			Write-Host "  2. Look for the 'Individual components' section located as the second option in the top left and select the following components:" -ForegroundColor Yellow
			Write-Host "     2.1. 'MSVC v143 - VS 2022 C++ x64/x86 Spectre-mitigated libs (latest)'." -ForegroundColor Yellow
			Write-Host "     2.2. 'Windows Driver Kit' if you see it listed." -ForegroundColor Yellow
			Write-Host "  3. Install Visual Studio." -ForegroundColor Yellow

			$webClient = New-Object System.Net.WebClient
			$webClient.DownloadFile($ConfigURLs["URLVisualStudio2022"], "$folderTempRootkitsRequirementBinariesPath\VisualStudioSetup.exe")
			$process = Start-Process -FilePath "$folderTempRootkitsRequirementBinariesPath\VisualStudioSetup.exe" -PassThru
			$process.WaitForExit()
			while ($true) {
				$response = Read-Host "Installation completed? (Y/N)"
				if ($response -eq "Y") {
					break
				}
			}
			Write-Host "Installed - Visual Studio 2022 Community" -ForegroundColor Yellow
		}

		# SDK
		$install = Read-Host "Do you want to install Windows Software Development Kit (SDK)? (Y/N)"
		if ($install -eq "Y") {
			Write-Host "Install Windows Software Development Kit (SDK):" -ForegroundColor Yellow
			Write-Host "  1. Ensure that all the pre-selected features are left marked." -ForegroundColor Yellow

			$webClient = New-Object System.Net.WebClient
			$webClient.DownloadFile($ConfigURLs["URLSdk"], "$folderTempRootkitsRequirementBinariesPath\winsdksetup.exe")
			$process = Start-Process -FilePath "$folderTempRootkitsRequirementBinariesPath\winsdksetup.exe" -PassThru
			$process.WaitForExit()
			while ($true) {
				$response = Read-Host "Installation completed? (Y/N)"
				if ($response -eq "Y") {
					break
				}
			}
			Write-Host "Installed - Windows Software Development Kit (SDK)" -ForegroundColor Yellow
		}

		# WDK
		$install = Read-Host "Do you want to install Windows Driver Kit (WDK)? (Y/N)"
		if ($install -eq "Y") {
			Write-Host "Install Windows Driver Kit (WDK):" -ForegroundColor Yellow
			Write-Host "  1. Starting with Visual Studio version 17.11.0, the WDK requires the 'Windows Driver Kit' component to be installed in Visual Studio." -ForegroundColor Yellow
			Write-Host "     1.1. If you see the 'Important Information' popup at the beginning, confirming that your Visual Studio instance does not comply with this prerequisite:" -ForegroundColor Yellow
			Write-Host "         1.1.1. Stop the WDK installer by closing the popup." -ForegroundColor Yellow
			Write-Host "         1.1.2. Launch the Visual Studio Installer and select 'Modify'." -ForegroundColor Yellow
			Write-Host "         1.1.3. Navigate to the 'Individual Components' tab." -ForegroundColor Yellow
			Write-Host "         1.1.4. Check 'Windows Driver Kit' under the list of components." -ForegroundColor Yellow
			Write-Host "         1.1.5. Select 'Modify' again to apply the changes." -ForegroundColor Yellow
			Write-Host "         1.1.6. Once the changes are applied, relaunch this script and select only the option to install the Windows Driver Kit (WDK) to continue the installation." -ForegroundColor Yellow
			Write-Host "  2. At the end of the WDK installation process, you may see a popup prompting you to install the 'Windows Driver Kit Visual Studio extension (WDK VSIX)':" -ForegroundColor Yellow
			Write-Host "     2.1. Ensure that the checkbox for 'Install Windows Driver Kit Visual Studio extension' is selected (it is checked by default). Clicking 'Close' will automatically launch the installer for the extension." -ForegroundColor Yellow

			$webClient = New-Object System.Net.WebClient
			$webClient.DownloadFile($ConfigURLs["URLWdk"], "$folderTempRootkitsRequirementBinariesPath\wdksetup.exe")
			$process = Start-Process -FilePath "$folderTempRootkitsRequirementBinariesPath\wdksetup.exe" -PassThru
			$process.WaitForExit()
			while ($true) {
				$response = Read-Host "Installation completed? (Y/N)"
				if ($response -eq "Y") {
					break
				}
			}
			Write-Host "Installed - Windows Driver Kit (WDK)" -ForegroundColor Yellow
		}

		# Visual Studio Code
		$install = Read-Host "Do you want to install Visual Studio Code? (Y/N)"
		if ($install -eq "Y") {
			Write-Host "Install Visual Studio Code" -ForegroundColor Yellow

			$webClient = New-Object System.Net.WebClient
			$webClient.DownloadFile($ConfigURLs["URLVisualStudioCode"], "$folderTempRootkitsRequirementBinariesPath\VSCodeUserSetup.exe")
			$process = Start-Process -FilePath "$folderTempRootkitsRequirementBinariesPath\VSCodeUserSetup.exe" -PassThru
			$process.WaitForExit()
			while ($true) {
				$response = Read-Host "Installation completed? (Y/N)"
				if ($response -eq "Y") {
					break
				}
			}
			Write-Host "Installed - Visual Studio Code" -ForegroundColor Yellow
		}

		Remove-Item $folderTempRootkitsRequirementBinariesPath -Recurse
	}
	Write-Host "Please restart the computer" -ForegroundColor Magenta
}

# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionRootkitsSetUp {

	# Administrator
	function Test-Administrator {
		$currentUser = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
		return $currentUser.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
	}

	Write-Host "You have selected the option 'Rootkits - Set Up Environment -> Enable Test Mode + Disable Integrity Checks'" -ForegroundColor Green
	$response = Read-Host "Do you want to proceed? (Press 'Y')"
	if ($response -eq "Y") {
		
		if (Test-Administrator) {

			# Information for the user
			Write-Host "Test Mode and Integrity Checks are verification settings for Windows. Here's what they do:" -ForegroundColor Yellow
			Write-Host "  1. Test Signing Mode (Test Mode): Allows the loading of test-signed kernel-mode drivers, typically used for development and testing purposes." -ForegroundColor Yellow
			Write-Host "  2. Disable Integrity Checks: Disables system-wide code integrity checks. Note that this option can not be set if Secure Boot is enabled." -ForegroundColor Yellow


			# Test Mode
			$install = Read-Host "Do you want to enable Windows Test Mode? (Y/N)"
			if ($install -eq "Y") {
				Invoke-Expression -Command "bcdedit /set testsigning on"
				Write-Host "Enabled - Windows Test Signing Mode" -ForegroundColor Yellow
				Write-Host "Please restart the computer" -ForegroundColor Magenta
			}

			# Integrity Checks
			$install = Read-Host "Do you want to disable Integrity Checks? (Y/N)"
			if ($install -eq "Y") {
				Invoke-Expression -Command "bcdedit /set nointegritychecks on"
				Write-Host "Disabled - Integrity checks" -ForegroundColor Yellow
				Write-Host "Please restart the computer" -ForegroundColor Magenta
			}

		} else {
			Write-Host "This script option must be run as an administrator." -ForegroundColor Red
		}
	}
}

# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionRootkitsTools {

	Write-Host "You have selected the option 'Rootkits - Tools -> OSR Driver Loader + Ghydra + IDA Free'" -ForegroundColor Green
	$response = Read-Host "Do you want to proceed? (Press 'Y')"
	if ($response -eq "Y") {

		# Temp folder
		$folderTempRootkitsToolsBinaries = "TemporalRootkitsToolsBinaries"
		$folderTempRootkitsToolsBinariesPath = Join-Path -Path $PWD -ChildPath $folderTempRootkitsToolsBinaries
		if (-not (Test-Path -Path $folderTempRootkitsToolsBinariesPath)) {
			New-Item -ItemType Directory -Path $folderTempRootkitsToolsBinariesPath | Out-Null
		}

		# ABR_Rootkits_Tools
		$folderRootkitsTools = "ABR_Rootkits_Tools"
		$folderRootkitsToolsPath = Join-Path -Path $PWD -ChildPath $folderRootkitsTools

		if (-not (Test-Path -Path $folderRootkitsToolsPath)) {
			New-Item -ItemType Directory -Path $folderRootkitsToolsPath | Out-Null
			Write-Host "Created folder: $folderRootkitsTools" -ForegroundColor Yellow
		} else {
			Write-Host "The folder '$folderRootkitsToolsPath' already exists in this directory. Proceeding with downloads." -ForegroundColor Red
		}

		# OSR Driver Loader
		$install = Read-Host "Do you want to download OSR Driver Loader? (Y/N)"
		if ($install -eq "Y") {
			if (-not (Test-Path -Path $folderRootkitsToolsPath\OSRDriverLoader)) {

				$webClient = New-Object System.Net.WebClient
				$webClient.DownloadFile($ConfigURLs["URLOsrLoader"], "$folderRootkitsToolsPath\osrloaderv30.zip")
				Expand-Archive -Path $folderRootkitsToolsPath\osrloaderv30.zip -DestinationPath $folderRootkitsToolsPath\OSRDriverLoader
				Remove-Item $folderRootkitsToolsPath\osrloaderv30.zip
				Write-Host "Downloaded - OSR Driver Loader" -ForegroundColor Yellow

			} else {
				Write-Host "The folder '$folderRootkitsToolsPath\OSRDriverLoader' already exists in this directory. Unable to proceed." -ForegroundColor Red
			}
		}

		# Ghydra
		$install = Read-Host "Do you want to download Ghydra? (Y/N)"
		if ($install -eq "Y") {
			if (-not (Test-Path -Path $folderRootkitsToolsPath\Ghydra)) {

				$webClient = New-Object System.Net.WebClient
				$webClient.DownloadFile($ConfigURLs["URLGhydra"], "$folderRootkitsToolsPath\ghidra_11.3_PUBLIC_20250205.zip")
				Expand-Archive -Path $folderRootkitsToolsPath\ghidra_11.3_PUBLIC_20250205.zip -DestinationPath $folderRootkitsToolsPath\Ghydra
				Remove-Item $folderRootkitsToolsPath\ghidra_11.3_PUBLIC_20250205.zip
				Write-Host "Downloaded - Ghydra" -ForegroundColor Yellow

			} else {
				Write-Host "The folder '$folderRootkitsToolsPath\Ghydra' already exists in this directory. Unable to proceed." -ForegroundColor Red
			}
		}
		
		# IDA Free
		$install = Read-Host "Do you want to install IDA Free? (Y/N)"
		if ($install -eq "Y") {
			Write-Host "Install IDA Free" -ForegroundColor Yellow

			$webClient = New-Object System.Net.WebClient
			$webClient.DownloadFile($ConfigURLs["URLIdaFree"], "$folderTempRootkitsToolsBinariesPath\idafree84_windows.exe")
			$process = Start-Process -FilePath "$folderTempRootkitsToolsBinariesPath\idafree84_windows.exe" -PassThru
			$process.WaitForExit()
			while ($true) {
				$response = Read-Host "Installation completed? (Y/N)"
				if ($response -eq "Y") {
					break
				}
			}
			Write-Host "Installed - IDA Free" -ForegroundColor Yellow
		}

		Remove-Item $folderTempRootkitsToolsBinariesPath -Recurse

	}
}

# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionRootkitsPoCs {

	Write-Host "You have selected the option 'Rootkits - PoCs -> Kernel Mode Drivers & Console Applications'" -ForegroundColor Green
	$response = Read-Host "Do you want to proceed? (Press 'Y')"
	if ($response -eq "Y") {

		# ABR_Rootkits_PoCs
		$folderRootkitsPoCs = "ABR_Rootkits_PoCs"
		$folderRootkitsPoCsPath = Join-Path -Path $PWD -ChildPath $folderRootkitsPoCs

		if (-not (Test-Path -Path $folderRootkitsPoCsPath)) {
			New-Item -ItemType Directory -Path $folderRootkitsPoCsPath | Out-Null
			Write-Host "Created folder: $folderRootkitsPoCs" -ForegroundColor Yellow
		}

		# Hello World
		$folderRootkitPoC1 = "Rootkit01_HelloWorld"
		$folderRootkitPoC1Path = Join-Path -Path $folderRootkitsPoCsPath -ChildPath $folderRootkitPoC1
		if (-not (Test-Path -Path $folderRootkitPoC1Path)) {
			New-Item -ItemType Directory -Path $folderRootkitPoC1Path | Out-Null
		}

		$contentRootkitPoC1Driver = ""
		$contentRootkitPoC1DriverBytes = [System.Convert]::FromBase64String($contentRootkitPoC1Driver)
		[System.IO.File]::WriteAllBytes("$folderRootkitPoC1Path\DriverHelloWorld.c", $contentRootkitPoC1DriverBytes)

		$contentRootkitPoC1DriverNotes = ""
		$contentRootkitPoC1DriverNotesBytes = [System.Convert]::FromBase64String($contentRootkitPoC1DriverNotes)
		[System.IO.File]::WriteAllBytes("$folderRootkitPoC1Path\README.md", $contentRootkitPoC1DriverNotesBytes)

		Write-Host "Created - Kernel Mode Driver (Hello World)" -ForegroundColor Yellow

		# IOCTLs
		$folderRootkitPoC2 = "Rootkit02_IOCTLs"
		$folderRootkitPoC2Path = Join-Path -Path $folderRootkitsPoCsPath -ChildPath $folderRootkitPoC2
		if (-not (Test-Path -Path $folderRootkitPoC2Path)) {
			New-Item -ItemType Directory -Path $folderRootkitPoC2Path | Out-Null
		}

		$contentRootkitPoC2Driver = ""
		$contentRootkitPoC2DriverBytes = [System.Convert]::FromBase64String($contentRootkitPoC2Driver)
		[System.IO.File]::WriteAllBytes("$folderRootkitPoC2\DriverIOCTLs.c", $contentKMDFIOCTLsBytes)

		$contentRootkitPoC2Application = ""
		$contentRootkitPoC2ApplicationBytes = [System.Convert]::FromBase64String($contentRootkitPoC2Application)
		[System.IO.File]::WriteAllBytes("$folderRootkitPoC2\ApplicationIOCTLs.c", $contentRootkitPoC2ApplicationBytes)

		$contentRootkitPoC2Notes = ""
		$contentRootkitPoC2NotesBytes = [System.Convert]::FromBase64String($contentRootkitPoC2Notes)
		[System.IO.File]::WriteAllBytes("$folderRootkitPoC2\README.md", $contentRootkitPoC2NotesBytes)

		Write-Host "Created - Kernel Mode Driver (IOCTLs)" -ForegroundColor Yellow

	}
}

# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionResourcesMyRepositories {

	Write-Host "You have selected the option 'Resources - My Repositories -> A compilation of resources dedicated to bootkit and rootkit development'" -ForegroundColor Green
	$response = Read-Host "Do you want to proceed? (Press 'Y')"

	if ($response -eq "Y") {
		Write-Host "[+] My Resources and Repositories related to Bootkits & Rootkits:" -ForegroundColor Cyan
		Write-Host "   * Bootkits & Rootkits Development Environment"
		Write-Host "      -> Scripts to automate the development environment setup"
		Write-Host "        https://github.com/TheMalwareGuardian/Bootkits-Rootkits-Development-Environment" -ForegroundColor Red
		Write-Host "   * Awesome Bootkits & Rootkits Resources"
		Write-Host "      -> Compilation of hundreds of resources, guides, videos, and more"
		Write-Host "        https://github.com/TheMalwareGuardian/Awesome-Bootkits-Rootkits-Development" -ForegroundColor Red
		Write-Host "   * Abismo - UEFI Bootkit"
		Write-Host "      -> A UEFI-based bootkit for research into system boot and the development of UEFI applications and DXE drivers"
		Write-Host "        https://github.com/TheMalwareGuardian/Abismo" -ForegroundColor Red
		Write-Host "   * Bentico - Windows Kernel Rootkit"
		Write-Host "      -> A kernel-mode rootkit for learning and experimentation with Windows internals"
		Write-Host "        https://github.com/TheMalwareGuardian/Bentico" -ForegroundColor Red
		Write-Host "   * WinDbg Scripting & Debugging"
		Write-Host "      -> Scripts, commands, and documentation for Windows debugging"
		Write-Host "        https://github.com/TheMalwareGuardian/WinDbg_Scripting" -ForegroundColor Red
		Write-Host "[+] All repositories are public. Enjoy!" -ForegroundColor Green
	}
}


# ---------------------------------------------------------------------------------------------------------------------------------------------------------
do {
	Show-Menu
	$choice = Read-Host "Choose an option"
	switch ($choice) {
		'1a' { OptionBootkitsRequirements }
		'1b' { OptionBootkitsSetUp }
		'1c' { OptionBootkitsTools }
		'1d' { OptionBootkitsPoCs }
		'2a' { OptionDebuggingRequirements }
		'2b' { OptionDebuggingSetUp }
		'2c' { OptionDebuggingTools }
		'2d' { OptionDebuggingScripting }
		'2e' { OptionDebuggingDiagram }
		'3a' { OptionRootkitsRequirements }
		'3b' { OptionRootkitsSetUp }
		'3c' { OptionRootkitsTools }
		'3d' { OptionRootkitsPoCs }
		'4a' { OptionResourcesMyRepositories }
		'Q' { break }
		default { Write-Host "Invalid option. Please choose again." }
	}
	Write-Host "Press any key to continue..."
	$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
} while ($choice -ne 'Q')
