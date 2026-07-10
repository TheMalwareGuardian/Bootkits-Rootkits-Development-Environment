#!/bin/bash

# ---------------------------------------------------------------------------------------------------------------------------------------------------------

# ==========================================================================================
# Bootkits & Rootkits Development Environment (Linux Bash)
# TheMalwareGuardian
# ==========================================================================================



# ---------------------------------------------------------------------------------------------------------------------------------------------------------
# My
GLOBAL_URL_MY_REPOSITORY="https://github.com/TheMalwareGuardian/"
GLOBAL_URL_MY_LINKEDIN="https://www.linkedin.com/in/vazquez-vazquez-alejandro/"
GLOBAL_URL_MY_REPOSITORY_ENVIRONMENT="https://github.com/TheMalwareGuardian/Bootkits-Rootkits-Development-Environment"
GLOBAL_URL_MY_REPOSITORY_AWESOME="https://github.com/TheMalwareGuardian/Awesome-Bootkits-Rootkits-Development"
GLOBAL_URL_MY_REPOSITORY_BOOTKITS_ROOTKITS_TIMELINE="https://github.com/TheMalwareGuardian/Bootkits-Rootkits-Timeline"
GLOBAL_URL_MY_REPOSITORY_BOOTKITS_STARTER_PACK="https://github.com/TheMalwareGuardian/Bootkits-Development-Starter-Pack"
GLOBAL_URL_MY_REPOSITORY_ROOTKITS_STARTER_PACK="https://github.com/TheMalwareGuardian/Rootkits-Development-Starter-Pack"
GLOBAL_URL_MY_REPOSITORY_BOOTKIT_ABYSS="https://github.com/TheMalwareGuardian/Abyss"
GLOBAL_URL_MY_REPOSITORY_BOOTKIT_ANTARCTIC="https://github.com/TheMalwareGuardian/Antarctic"
GLOBAL_URL_MY_REPOSITORY_ROOTKIT_GILLYWEED="https://github.com/TheMalwareGuardian/Gillyweed"
GLOBAL_URL_MY_REPOSITORY_ROOTKIT_LIMINALIS="https://github.com/TheMalwareGuardian/Liminalis"
GLOBAL_URL_MY_REPOSITORY_UEFI_FIRMWARE_ANALYSIS="https://github.com/TheMalwareGuardian/UEFI-Firmware-Analysis"
GLOBAL_URL_MY_REPOSITORY_UEFI_VULNERABILITY_RESEARCH="https://github.com/TheMalwareGuardian/UEFI-Vulnerability-Research-and-Exploit-Development"
GLOBAL_URL_MY_REPOSITORY_DEBUGGING_UEFI="https://github.com/TheMalwareGuardian/Debugging-UEFI-Applications-for-Vulnerability-Research-and-Malware-Analysis"
GLOBAL_URL_MY_REPOSITORY_AWESOME_BYOVUA="https://github.com/TheMalwareGuardian/Awesome-Bring-Your-Own-Vulnerable-UEFI-Application"
GLOBAL_URL_MY_REPOSITORY_QEMU_UEFI_RESEARCH="https://github.com/TheMalwareGuardian/QEMU-UEFI-Research-Environment"
GLOBAL_URL_MY_REPOSITORY_VMWARE_SECURE_BOOT="https://github.com/TheMalwareGuardian/VMware-Secure-Boot-Custom-Keys"
# Bootkits Setup
GLOBAL_URL_BOOTKITS_SETUP_EDK2="https://github.com/tianocore/edk2"
GLOBAL_URL_BOOTKITS_SETUP_GRUB2="https://git.savannah.gnu.org/git/grub.git"
# Bootkits Tools
GLOBAL_URL_BOOTKITS_TOOLS_EXTRACT_VMLINUX="https://raw.githubusercontent.com/torvalds/linux/master/scripts/extract-vmlinux"
# Microsoft UEFI Certificates
GLOBAL_URL_MS_CERT_PK="https://go.microsoft.com/fwlink/?linkid=2255361"
GLOBAL_URL_MS_CERT_KEK="https://go.microsoft.com/fwlink/?linkid=2239775"
GLOBAL_URL_MS_CERT_UEFI_CA_2023="https://go.microsoft.com/fwlink/?linkid=2239872"
GLOBAL_URL_MS_CERT_UEFI_CA_2011="https://go.microsoft.com/fwlink/p/?linkid=321194"
GLOBAL_URL_MS_CERT_OPTION_ROM="https://go.microsoft.com/fwlink/?linkid=2284009"
GLOBAL_URL_MS_CERT_WINDOWS_CA_2023="https://go.microsoft.com/fwlink/?linkid=2239776"



# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function ShowMenu {
	clear
	echo "=============================================================================================="
	echo "Overview:"
	echo " - Bash Script for Automating Bootkits/Rootkits Development Environment Setup in Linux"
	echo "Note:"
	echo " - All options have been tested on Ubuntu 24.04 LTS"
	echo "LinkedIn:"
	echo " - $GLOBAL_URL_MY_LINKEDIN"
	echo "Github:"
	echo " - $GLOBAL_URL_MY_REPOSITORY"
	echo "=============================================================================================="
	echo ""
	echo ""
	echo "------------------------------------------- MENU ---------------------------------------------"
	echo " BOOTKITS"
	echo "	1a. Bootkits   - Requirements              -> GCC + Git + Python + NASM + ASL"
	echo "	1b. Bootkits   - Set Up Environment        -> EDK2"
	echo "	1c. Bootkits   - Tools                     -> OpenSSL + efitools + sbsigntools"
	echo "	1d. Bootkits   - PoCs                      -> UEFI Applications + DXE Runtime Drivers [Windows / Linux]"
	echo "	1e. Bootkits   - Keys                      -> Generate test keys and certificates"
	echo "	1f. Bootkits   - RE                        -> GRUB2"
	echo "	1g. Bootkits   - RE                        -> Linux Kernel"
	echo "	1h. Bootkits   - RE                        -> Linux Boot Process [ESP + SHIM + GRUB + vmlinuz + vmlinux]"
	echo ""
	echo " ROOTKITS"
	echo "	3a. Rootkits   - Requirements              -> linux-headers + libbpf"
	echo "	3b. Rootkits   - PoCs                      -> LKM Rootkits & eBPF Programs"
	echo ""
	echo " RESOURCES"
	echo "	4a. Resources  - My Repositories           -> A compilation of resources dedicated to bootkit and rootkit development"
	echo ""
	echo " PROGRAM TERMINATION"
	echo "	Q. Exit"
	echo "----------------------------------------------------------------------------------------------"
}



# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionBootkitsRequirements {
	echo -e "\033[1;32m[!] You have selected the option 'Bootkits - Requirements -> GCC + Git + Python + NASM + ASL'\033[0m"
	read -p "[?] Do you want to proceed? (Press 'Y'): " response
	if [[ "$response" == "Y" ]]; then
		echo "[*] Proceeding with installation..."
		sudo apt-get update
		sudo apt-get install -y net-tools build-essential uuid-dev iasl acpica-tools nasm git python-is-python3 autoconf automake autopoint libtool bison flex gettext pkg-config texinfo gawk xorriso grub-pc-bin grub-efi-amd64-bin m4 help2man libfreetype-dev libfuse-dev libfuse3-dev libtasn1-6-dev liblzma-dev libdevmapper-dev libzfslinux-dev
		echo "[+] Installation completed."
	else
		echo "[-] Operation aborted."
	fi
}



# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionBootkitsSetUp {
	echo -e "\033[1;32m[!] You have selected the option 'Bootkits - Set Up Environment -> EDK2'\033[0m"

	read -p "[?] Do you want to proceed with setting up EDK2? (Y/N): " confirm
	if [[ "$confirm" != "Y" ]]; then
		echo "[-] Operation aborted."
		return
	fi

	LOCAL_EDK2_SRC_DIR="$HOME/src/edk2"

	# Clone
	read -p "[?] Do you want to clone the EDK2 repository with submodules? (Y/N): " confirm_clone
	if [[ "$confirm_clone" == "Y" ]]; then
		if [ ! -d "$LOCAL_EDK2_SRC_DIR" ]; then
			echo "[*] Creating base directory and cloning EDK2 repository with submodules..."
			mkdir -p "$(dirname "$LOCAL_EDK2_SRC_DIR")"
			cd "$(dirname "$LOCAL_EDK2_SRC_DIR")"
			git clone --recurse-submodules "$GLOBAL_URL_BOOTKITS_SETUP_EDK2" "$LOCAL_EDK2_SRC_DIR"
		else
			echo "[!] EDK2 directory already exists. Skipping clone."
		fi
	else
		echo "[-] Clone skipped."
	fi

	if [ ! -d "$LOCAL_EDK2_SRC_DIR" ]; then
		echo "[!] Error: EDK2 directory not found at $LOCAL_EDK2_SRC_DIR. Cannot continue."
		return
	fi

	cd "$LOCAL_EDK2_SRC_DIR"

	# Submodules
	read -p "[?] Do you want to initialize submodules? (Y/N): " confirm
	if [[ "$confirm" == "Y" ]]; then
		git submodule update --init
		echo "[+] Submodules initialized."
	else
		echo "[-] Skipped submodule initialization."
	fi

	# BaseTools
	read -p "[?] Do you want to build BaseTools? (Y/N): " confirm
	if [[ "$confirm" == "Y" ]]; then
		make -C BaseTools
		echo "[+] BaseTools built."
	else
		echo "[-] Skipped BaseTools build."
	fi

	# edksetup.sh
	read -p "[?] Do you want to source edksetup.sh with BaseTools? (Y/N): " confirm
	if [[ "$confirm" == "Y" ]]; then
		export EDK_TOOLS_PATH="$LOCAL_EDK2_SRC_DIR/BaseTools"
		. edksetup.sh BaseTools
		echo "[+] Environment sourced."
	else
		echo "[-] Skipped sourcing edksetup.sh."
	fi

	# target.txt
	read -p "[?] Do you want to modify Conf/target.txt? (Y/N): " confirm
	if [[ "$confirm" == "Y" ]]; then
		sed -i 's|^ACTIVE_PLATFORM.*|ACTIVE_PLATFORM = MdeModulePkg/MdeModulePkg.dsc|' Conf/target.txt
		sed -i 's/^TOOL_CHAIN_TAG.*/TOOL_CHAIN_TAG = GCC/' Conf/target.txt
		sed -i 's/^TARGET_ARCH.*/TARGET_ARCH = X64/' Conf/target.txt
		# Uncomment to enable multi-threaded builds (optional)
		# sed -i 's/^MAX_CONCURRENT_THREAD_NUMBER.*/MAX_CONCURRENT_THREAD_NUMBER = 9/' Conf/target.txt
		echo "[+] Conf/target.txt updated."
	else
		echo "[-] Skipped editing Conf/target.txt."
	fi

	# Build
	read -p "[?] Do you want to build MdeModulePkg now? (Y/N): " confirm
	if [[ "$confirm" == "Y" ]]; then
		build

		LOCAL_HELLO_EFI_SRC="$LOCAL_EDK2_SRC_DIR/Build/MdeModule/DEBUG_GCC/X64/HelloWorld.efi"
		LOCAL_HELLO_EFI_DST="/boot/efi/EFI/Bootkits/HelloWorld.efi"

		if [ -f "$LOCAL_HELLO_EFI_SRC" ]; then
			echo "[+] Build completed: HelloWorld.efi located at $LOCAL_HELLO_EFI_SRC"

			if [ -f "$LOCAL_HELLO_EFI_DST" ]; then
				echo "[!] HelloWorld.efi already exists in the ESP at $LOCAL_HELLO_EFI_DST. Skipping copy."
			else
				echo "[*] Copying HelloWorld.efi to the ESP..."
				sudo mkdir -p "/boot/efi/EFI/Bootkits"
				sudo cp "$LOCAL_HELLO_EFI_SRC" "$LOCAL_HELLO_EFI_DST"
				echo "[+] HelloWorld.efi copied to $LOCAL_HELLO_EFI_DST"
			fi
		else
			echo "[!] Build completed, but HelloWorld.efi not found at expected location."
		fi
	else
		echo "[-] Skipped build process."
	fi
}



# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionBootkitsTools {
	echo -e "\033[1;32m[!] You have selected the option 'Bootkits - Tools -> OpenSSL + efitools + sbsigntools'\033[0m"
	read -p "[?] Do you want to proceed with installing OpenSSL and sbsigntools? (Y/N): " response
	if [[ "$response" == "Y" ]]; then
		echo "[*] Installing tools for UEFI signing..."
		sudo apt-get update
		sudo apt-get install -y openssl efitools sbsigntool mtools curl pesign
		echo "[+] OpenSSL, efitools and sbsigntools installed."
	else
		echo "[-] Operation aborted."
	fi
}



# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionBootkitsPoCs {
	echo -e "\033[1;32m[!] You have selected the option 'Bootkits - PoCs -> UEFI Applications + DXE Runtime Drivers [Windows / Linux]'\033[0m"
	read -p "[?] Do you want to proceed? (Press 'Y'): " response
	if [[ "$response" == "Y" ]]; then

		# ABR_Bootkits_PoCs
		LOCAL_FOLDER_BOOTKITS_POCS="ABR_Bootkits_PoCs"

		if [ ! -d "$LOCAL_FOLDER_BOOTKITS_POCS" ]; then
			mkdir -p "$LOCAL_FOLDER_BOOTKITS_POCS"
			echo "[+] Created folder: $LOCAL_FOLDER_BOOTKITS_POCS"
		fi

		echo ""
		echo "[*] In earlier versions of this section, PoCs were embedded as base64 blobs decoded and saved to disk."
		echo "[*] Over time they've been organized into GitHub repositories, making it much easier to clone and explore them."
		echo "[*] These repositories are ideal for beginners who want to understand how UEFI Applications and DXE Runtime Drivers work in the context of Bootkits and low-level malware."
		echo ""

		# Bootkits Development Starter Pack
		LOCAL_STARTER_PATH="$LOCAL_FOLDER_BOOTKITS_POCS/Bootkits-Development-Starter-Pack"
		if [ ! -d "$LOCAL_STARTER_PATH" ]; then
			read -p "[?] Do you want to clone the 'Bootkits Development Starter Pack' repository? (Y/N): " clone
			if [[ "$clone" == "Y" ]]; then
				git clone "$GLOBAL_URL_MY_REPOSITORY_BOOTKITS_STARTER_PACK" "$LOCAL_STARTER_PATH"
				echo "[+] Repository cloned successfully. You'll find basic Bootkit PoCs inside the 'Bootkits' folder."
			fi
		else
			echo "[!] The folder '$LOCAL_STARTER_PATH' already exists. Unable to proceed."
		fi

		# Abyss (Windows Bootkit)
		LOCAL_ABYSS_PATH="$LOCAL_FOLDER_BOOTKITS_POCS/Abyss"
		if [ ! -d "$LOCAL_ABYSS_PATH" ]; then
			read -p "[?] Do you want to clone the Abyss (Windows Bootkit) repository? (Y/N): " clone
			if [[ "$clone" == "Y" ]]; then
				git clone "$GLOBAL_URL_MY_REPOSITORY_BOOTKIT_ABYSS" "$LOCAL_ABYSS_PATH"
				echo "[+] Repository cloned successfully. The 'AbyssBootkitPkg' folder contains a fully functional Windows UEFI Bootkit."
			fi
		else
			echo "[!] The folder '$LOCAL_ABYSS_PATH' already exists. Unable to proceed."
		fi

		# Antarctic (Linux Bootkit)
		LOCAL_ANTARCTIC_PATH="$LOCAL_FOLDER_BOOTKITS_POCS/Antarctic"
		if [ ! -d "$LOCAL_ANTARCTIC_PATH" ]; then
			read -p "[?] Do you want to clone the Antarctic (Linux Bootkit) repository? (Y/N): " clone
			if [[ "$clone" == "Y" ]]; then
				git clone "$GLOBAL_URL_MY_REPOSITORY_BOOTKIT_ANTARCTIC" "$LOCAL_ANTARCTIC_PATH"
				echo "[+] Repository cloned successfully. The 'AntarcticBootkitPkg' folder contains a fully functional Linux UEFI Bootkit."
			fi
		else
			echo "[!] The folder '$LOCAL_ANTARCTIC_PATH' already exists. Unable to proceed."
		fi

		# Build Instructions
		echo ""
		echo "[*] Most Bootkits and PoCs in these repositories follow the EDK2 project structure. That means you will find folders ending with 'Pkg' (e.g., AbyssBootkitPkg, AntarcticBootkitPkg, etc.). Folders that represent complete UEFI packages ready to be compiled using EDK2."
		echo ""
		echo "[*] To build them, follow these steps:"
		echo ""
		echo "  1. Clone the repository."
		echo "        git clone https://github.com/TheMalwareGuardian/CHANGEME"
		echo "  2. Initialize submodules (some projects depend on external components):"
		echo "        git submodule update --init --recursive"
		echo "  3. Move the *Pkg folder (e.g., AntarcticBootkitPkg) into your EDK2 workspace:"
		echo "        ~/src/edk2/"
		echo "  4. Source the build environment and build:"
		echo "        export EDK_TOOLS_PATH=~/src/edk2/BaseTools"
		echo "        . edksetup.sh BaseTools"
		echo "        build"
		echo ""
		echo -e "\033[1;33m[!] NOTE: The Bootkits we build are designed for research, red teaming, and educational purposes :)\033[0m"
		echo ""
		echo "[*] For more Proof-of-Concepts, check out the following repository:"
		echo "   * Awesome Bootkits & Rootkits Resources"
		echo "      -> Compilation of hundreds of resources, guides, videos, pocs, and more"
		echo "        $GLOBAL_URL_MY_REPOSITORY_AWESOME"
		echo ""
	else
		echo "[-] Operation aborted."
	fi
}



# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionBootkitsKeys {
	echo -e "\033[1;32m[!] You have selected the option 'Bootkits - Keys -> Generate test keys and certificates'\033[0m"
	read -p "[?] Do you want to proceed? (Press 'Y'): " response
	if [[ "$response" != "Y" ]]; then
		echo "[-] Operation aborted."
		return
	fi

	# Note
	echo ""
	echo -e "\033[1;33m[!] NOTE: This option exists out of nostalgia :(\033[0m"
	echo "[*] This script is where key generation for signing EFI binaries was first implemented, back when having an easy way to do it was the whole point. Since then, much more complete and polished versions of this option have been developed, covering both Windows and Linux, and those are the ones you should actually be using:"
	echo ""
	echo "   * QEMU UEFI Research Environment"
	echo "      -> QEMU/OVMF-based lab with full Secure Boot key enrollment and EFI signing workflow"
	echo "        $GLOBAL_URL_MY_REPOSITORY_QEMU_UEFI_RESEARCH"
	echo "   * VMware Secure Boot Custom Keys"
	echo "      -> VMware-focused environment for enrolling custom PK/KEK/DB and signing EFI binaries"
	echo "        $GLOBAL_URL_MY_REPOSITORY_VMWARE_SECURE_BOOT"
	echo ""
	echo "[*] Go check those out. What follows below still works, but consider it legacy."
	echo ""

	read -p "[?] Are you sure you want to proceed with the key generation? (Press 'Y'): " confirm
	if [[ "$confirm" != "Y" ]]; then
		echo "[-] Operation aborted."
		return
	fi

	for cmd in openssl cert-to-efi-sig-list sign-efi-sig-list sbsign sbverify mtools curl; do
		if ! command -v "$cmd" &>/dev/null; then
			echo "[!] Required tool '$cmd' is not installed. Please install it before proceeding."
			return
		fi
	done

	LOCAL_PK_SUBJ="/CN=TheMalwareGuardian PK/"
	LOCAL_KEK_SUBJ="/CN=TheMalwareGuardian KEK/"
	LOCAL_DB_SUBJ="/C=ES/ST=Galicia/L=Vilalba/O=The Malware Guardian/OU=Bootkits Department/CN=TheMalwareGuardian DB/"
	LOCAL_DBX_SUBJ="/CN=TheMalwareGuardian DBX/"
	LOCAL_PFX_PASSWORD="Changeme"

	LOCAL_EDK2_SRC_DIR="$HOME/src/edk2"
	LOCAL_CERT_DIR="$LOCAL_EDK2_SRC_DIR/KeysAndCertificates"
	LOCAL_HELLO_EFI_SRC="$LOCAL_EDK2_SRC_DIR/Build/MdeModule/DEBUG_GCC/X64/HelloWorld.efi"
	LOCAL_HELLO_EFI_SIGNED="$LOCAL_CERT_DIR/HelloWorldSigned.efi"
	LOCAL_HELLO_EFI_ORIGINAL="$LOCAL_CERT_DIR/HelloWorld.efi"

	if [ ! -d "$LOCAL_EDK2_SRC_DIR" ]; then
		echo "[!] EDK2 directory not found at $LOCAL_EDK2_SRC_DIR"
		echo "[-] You must first set up the Bootkits environment using option '1b'"
		return
	fi

	mkdir -p "$LOCAL_CERT_DIR"
	cd "$LOCAL_CERT_DIR"

	# Keys and Certificates
	read -p "[?] Do you want to generate test PK, KEK, and DB certificates? (Y/N): " keys_response
	if [[ "$keys_response" == "Y" ]]; then

		# PK
		echo "[*] Generating Platform Key (PK)..."
		openssl req -new -x509 -newkey rsa:2048 -keyout pk.key -out pk.crt -nodes -days 3650 -subj "$LOCAL_PK_SUBJ"
		openssl x509 -in pk.crt -outform DER -out pk.cer
		openssl x509 -in pk.crt -outform DER -out pk.der

		# KEK
		echo "[*] Generating Key Exchange Key (KEK)..."
		openssl req -new -newkey rsa:2048 -keyout kek.key -out kek.csr -nodes -subj "$LOCAL_KEK_SUBJ"
		openssl x509 -req -in kek.csr -days 3650 -CA pk.crt -CAkey pk.key -CAcreateserial -out kek.crt
		openssl x509 -in kek.crt -outform DER -out kek.cer
		openssl x509 -in kek.crt -outform DER -out kek.der

		# DB
		echo "[*] Generating Authorized Signature Database (DB)..."
		openssl req -new -newkey rsa:2048 -keyout db.key -out db.csr -nodes -subj "$LOCAL_DB_SUBJ"
		openssl x509 -req -in db.csr -days 3650 -CA kek.crt -CAkey kek.key -CAcreateserial -out db.crt
		openssl x509 -in db.crt -outform DER -out db.cer
		openssl x509 -in db.crt -outform DER -out db.der

		# PFX
		echo "[*] Generating PKCS#12 (PFX) bundle for DB..."
		openssl pkcs12 -export -out db.pfx -inkey db.key -in db.crt -name "TheMalwareGuardian" -passout pass:$LOCAL_PFX_PASSWORD

		# DBX
		echo "[*] Generating Forbidden Signature Database (DBX)..."
		openssl req -new -newkey rsa:2048 -keyout dbx.key -out dbx.csr -nodes -subj "$LOCAL_DBX_SUBJ"
		openssl x509 -req -in dbx.csr -days 3650 -CA kek.crt -CAkey kek.key -CAcreateserial -out dbx.crt
		openssl x509 -in dbx.crt -outform DER -out dbx.cer
		openssl x509 -in dbx.crt -outform DER -out dbx.der

		# ESL (EFI Signature List - raw database) and AUTH (signed ESL - used to enroll keys into firmware)
		echo "[*] Exporting certificates to ESL and AUTH formats..."
		cert-to-efi-sig-list pk.crt pk.esl
		sign-efi-sig-list -k pk.key -c pk.crt PK pk.esl pk.auth

		cert-to-efi-sig-list kek.crt kek.esl
		sign-efi-sig-list -k pk.key -c pk.crt KEK kek.esl kek.auth

		cert-to-efi-sig-list db.crt db.esl
		sign-efi-sig-list -k kek.key -c kek.crt db db.esl db.auth

		cert-to-efi-sig-list dbx.crt dbx.esl
		sign-efi-sig-list -k kek.key -c kek.crt dbx dbx.esl dbx.auth

		if [ -f "$LOCAL_HELLO_EFI_SRC" ]; then
			echo "[*] Copying original HelloWorld.efi..."
			cp "$LOCAL_HELLO_EFI_SRC" "$LOCAL_HELLO_EFI_ORIGINAL"
		else
			echo "[!] HelloWorld.efi not found at: $LOCAL_HELLO_EFI_SRC"
		fi

		echo ""
		echo "[+] Certificates generated in: $LOCAL_CERT_DIR"
	else
		echo "[-] Keys generation skipped."
	fi

	# EFI Tools
	read -p "[?] Do you want to search and copy EFI files like shimx64.efi, KeyTool.efi, MokManager.efi, and Shell.efi? (Y/N): " efi_response
	if [[ "$efi_response" == "Y" ]]; then

		for target in "KeyTool.efi" "shimx64.efi" "mmx64.efi" "Shell.efi"; do
			echo "[*] Searching for $target..."
			FOUND_PATH=$(find / \( -path /mnt -o -path /proc -o -path /sys \) -prune -false -o -iname "$target" -type f -print 2>/dev/null | head -n 1)
			if [ -n "$FOUND_PATH" ]; then
				cp "$FOUND_PATH" "$LOCAL_CERT_DIR/$target"
				echo "[+] Copied $target from: $FOUND_PATH"
			else
				echo "[!] $target not found"
			fi
		done

	else
		echo "[-] EFI tools copy skipped."
	fi

	# Microsoft Certificates
	read -p "[?] Do you want to download Microsoft public UEFI certificates? (Y/N): " ms_response
	if [[ "$ms_response" == "Y" ]]; then
		echo "[*] Downloading Microsoft public UEFI certificates..."
		curl -L -o "$LOCAL_CERT_DIR/Windows_OEM_Devices_PK.cer"              "$GLOBAL_URL_MS_CERT_PK"
		curl -L -o "$LOCAL_CERT_DIR/Microsoft_Corporation_KEK2K_CA_2023.cer"  "$GLOBAL_URL_MS_CERT_KEK"
		curl -L -o "$LOCAL_CERT_DIR/Microsoft_UEFI_CA_2023.cer"               "$GLOBAL_URL_MS_CERT_UEFI_CA_2023"
		curl -L -o "$LOCAL_CERT_DIR/Microsoft_Corporation_UEFI_CA_2011.cer"   "$GLOBAL_URL_MS_CERT_UEFI_CA_2011"
		curl -L -o "$LOCAL_CERT_DIR/Microsoft_Option_ROM_UEFI_CA_2023.cer"    "$GLOBAL_URL_MS_CERT_OPTION_ROM"
		curl -L -o "$LOCAL_CERT_DIR/Windows_UEFI_CA_2023.cer"                 "$GLOBAL_URL_MS_CERT_WINDOWS_CA_2023"
		echo "[+] Microsoft certificates downloaded to: $LOCAL_CERT_DIR"
	else
		echo "[-] Microsoft certificates download skipped."
	fi

	# Sign all EFI tools
	read -p "[?] Do you want to sign all EFI tools found in $LOCAL_CERT_DIR with the DB key? (Y/N): " sign_all_response
	if [[ "$sign_all_response" == "Y" ]]; then
		for efi_file in "$LOCAL_CERT_DIR"/*.efi; do
			[ -f "$efi_file" ] || continue
			base_name=$(basename "$efi_file" .efi)
			signed_name="$LOCAL_CERT_DIR/${base_name}_signed.efi"
			echo "[*] Signing $efi_file -> $signed_name"
			sbsign --key "$LOCAL_CERT_DIR/db.key" --cert "$LOCAL_CERT_DIR/db.crt" --output "$signed_name" "$efi_file"
		done
		echo "[+] All EFI tools signed with DB key."
	else
		echo "[-] Skipped bulk signing of EFI tools."
	fi

	# FAT32 Disk Image
		read -p "[?] Do you want to create a FAT32 disk image with all files for QEMU/OVMF testing? (Y/N): " disk_response
		if [[ "$disk_response" == "Y" ]]; then
			TMP_DIR="/tmp/uefi_disk_build"
			IMG_PATH="$TMP_DIR/efi_disk.img"
			MNT_DIR="/mnt/efi_disk"
			FINAL_IMG="$LOCAL_CERT_DIR/efi_disk.img"

			echo "[*] Creating temporary directory: $TMP_DIR"
			mkdir -p "$TMP_DIR"
			rm -f "$IMG_PATH"

			echo "[*] Creating 1024MB empty image..."
			dd if=/dev/zero of="$IMG_PATH" bs=1M count=1024 status=none

			echo "[*] Creating partition table and FAT32 partition..."
			parted -s "$IMG_PATH" mklabel msdos
			parted -s "$IMG_PATH" mkpart primary fat32 1MiB 100%
			LOOP_DEVICE=$(sudo losetup --find --show --partscan "$IMG_PATH")
			sleep 1

			echo "[*] Formatting partition ${LOOP_DEVICE}p1 as FAT32..."
			sudo mkfs.vfat "${LOOP_DEVICE}p1" > /dev/null

			echo "[*] Mounting partition..."
			sudo mkdir -p "$MNT_DIR"
			sudo mount "${LOOP_DEVICE}p1" "$MNT_DIR"

			# Directory structure
			sudo mkdir -p "$MNT_DIR/EFI/BOOT"
			sudo mkdir -p "$MNT_DIR/certs"
			sudo mkdir -p "$MNT_DIR/efi/tools"
			sudo mkdir -p "$MNT_DIR/efi/binaries"

			# Certificates and keys
			echo "[*] Copying certificates and keys..."
			for ext in key crt cer der csr esl auth pfx; do
				find "$LOCAL_CERT_DIR" -maxdepth 1 -type f -name "*.$ext" -exec sudo cp {} "$MNT_DIR/certs/" \;
			done

			# EFI tools (shimx64, KeyTool, Shell, mmx64, signed variants)
			echo "[*] Copying EFI tools..."
			find "$LOCAL_CERT_DIR" -maxdepth 1 -type f -name "*.efi" -exec sudo cp {} "$MNT_DIR/efi/tools/" \;

			# Copy Shell.efi as fallback bootloader so firmware can find it
			LOCAL_SHELL_EFI=$(find "$LOCAL_CERT_DIR" -maxdepth 1 -iname "Shell*.efi" | head -n 1)
			if [ -n "$LOCAL_SHELL_EFI" ]; then
				sudo cp "$LOCAL_SHELL_EFI" "$MNT_DIR/EFI/BOOT/BOOTX64.EFI"
				echo "[+] Shell.efi set as BOOTX64.EFI in EFI/BOOT/"
			fi

			# PoC EFI binaries (from known Pkg folders inside EDK2 Build)
			echo "[*] Searching for PoC EFI binaries..."
			LOCAL_POC_PKG_PREFIXES=("Abyss" "Antarctic" "UefiBootkit")
			declare -A SEEN_POC_BINS
			for prefix in "${LOCAL_POC_PKG_PREFIXES[@]}"; do
				while IFS= read -r poc_efi; do
					bin_name=$(basename "$poc_efi")
					if [[ -z "${SEEN_POC_BINS[$bin_name]}" ]]; then
						SEEN_POC_BINS[$bin_name]=1
						sudo cp "$poc_efi" "$MNT_DIR/efi/binaries/"
						echo "[+] Included PoC binary: $bin_name (from ${prefix}*Pkg)"
					fi
				done < <(find "$LOCAL_EDK2_SRC_DIR/Build" -type d -name "${prefix}*Pkg" 2>/dev/null | while read -r pkg_dir; do
					find "$pkg_dir" -name "*.efi" -type f
				done)
			done
			unset SEEN_POC_BINS

			echo "[*] Syncing and unmounting..."
			sync
			sudo umount "$MNT_DIR"
			sudo losetup -d "$LOOP_DEVICE"

			echo "[*] Copying final image to: $FINAL_IMG"
			cp "$IMG_PATH" "$FINAL_IMG"
			echo "[+] FAT32 image created successfully: $FINAL_IMG"
			echo ""
			echo "[*] Disk layout:"
			echo "      /EFI/BOOT/BOOTX64.EFI   -> Bootable Shell entry point"
			echo "      /certs/                  -> PK, KEK, DB, DBX keys and certificates (key, crt, cer, der, esl, auth, pfx)"
			echo "      /efi/tools/              -> shimx64.efi, KeyTool.efi, Shell.efi, mmx64.efi and signed variants"
			echo "      /efi/binaries/           -> Compiled EDK2 and PoC EFI binaries"
		else
			echo "[-] FAT32 image creation skipped."
		fi
	
<<comment
SHARED FOLDER

sudo mkdir -p /mnt/shared
sudo vmhgfs-fuse .host:/SharedFolder /mnt/shared -o allow_other
cp -r ~/src/edk2/KeysAndCertificates/ /mnt/shared/
ls /mnt/shared/
udisksctl loop-setup -f ~/src/edk2/KeysAndCertificates/efi_disk.img
comment
}



# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionBootkitsREGRUB {
	echo -e "\033[1;32m[!] You have selected the option 'Bootkits - RE -> GRUB2'\033[0m"

	read -p "[?] Do you want to proceed with cloning and building GRUB2? (Y/N): " confirm
	if [[ "$confirm" != "Y" ]]; then
		echo "[-] Operation aborted."
		return
	fi

	LOCAL_GRUB_SRC_DIR="$HOME/src/grub"
	LOCAL_GRUB_INSTALL_DIR="$LOCAL_GRUB_SRC_DIR/grub-install-dir-tmp"

	# Clone
	if [ ! -d "$LOCAL_GRUB_SRC_DIR" ]; then
		echo "[*] Cloning GRUB2 repository..."
		mkdir -p "$(dirname "$LOCAL_GRUB_SRC_DIR")"
		cd "$(dirname "$LOCAL_GRUB_SRC_DIR")"
		git clone "$GLOBAL_URL_BOOTKITS_SETUP_GRUB2" "$LOCAL_GRUB_SRC_DIR"
	else
		echo "[!] GRUB2 directory already exists at $LOCAL_GRUB_SRC_DIR. Skipping clone."
	fi

	cd "$LOCAL_GRUB_SRC_DIR"

	# Bootstrap
	read -p "[?] Run ./bootstrap? (Y/N): " bootstrap
	if [[ "$bootstrap" == "Y" ]]; then
		./bootstrap || { echo "[!] bootstrap failed"; return; }
		echo "[+] Bootstrap completed."
	fi

	# Configure
	read -p "[?] Run ./configure for x86_64-efi target? (Y/N): " configure
	if [[ "$configure" == "Y" ]]; then
		CFLAGS="-O0 -g -fno-omit-frame-pointer" \
		CXXFLAGS="-O0 -g -fno-omit-frame-pointer" \
		LDFLAGS="-g" \
		./configure --with-platform=efi --target=x86_64 --disable-werror || {
			echo "[!] Configure failed"; return;
		}
		echo "[+] Configure completed."
	fi

	# Build
	read -p "[?] Build GRUB now (make)? (Y/N): " build
	if [[ "$build" == "Y" ]]; then
		make -j$(nproc) || { echo "[!] make failed"; return; }
		echo "[+] GRUB build finished."
	fi

	# Install
	read -p "[?] Run make install to local folder ($LOCAL_GRUB_INSTALL_DIR)? (Y/N): " install
	if [[ "$install" == "Y" ]]; then
		rm -rf "$LOCAL_GRUB_INSTALL_DIR"
		make install DESTDIR="$LOCAL_GRUB_INSTALL_DIR" || { echo "[!] make install failed"; return; }
		echo "[+] GRUB installed to: $LOCAL_GRUB_INSTALL_DIR"
	fi

	# grubx64.efi
	read -p "[?] Generate grubx64.efi using grub-mkimage? (Y/N): " buildefi
	if [[ "$buildefi" == "Y" ]]; then
		OUTPUT_EFI="$LOCAL_GRUB_INSTALL_DIR/grubx64.efi"
		GRUB_MODULES_DIR="$LOCAL_GRUB_INSTALL_DIR/usr/local/lib/grub/x86_64-efi"

		if [ ! -d "$GRUB_MODULES_DIR" ]; then
			echo "[!] GRUB modules not found at $GRUB_MODULES_DIR. Did you run 'make install'?"
			return
		fi

		./grub-mkimage -O x86_64-efi -d "$GRUB_MODULES_DIR" -o "$OUTPUT_EFI" -p /boot/grub part_gpt part_msdos fat ext2 normal chain boot configfile linux multiboot multiboot2 || {
				echo "[!] grub-mkimage failed"
				return
			}
		echo "[+] grubx64.efi generated at: $OUTPUT_EFI"
	fi
}



# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionBootkitsREKernel {
	echo -e "\033[1;32m[!] You have selected the option 'Bootkits - RE -> Linux Kernel'\033[0m"
	echo ""
	echo "You have two options:"
	echo "  1) Install ddebs repositories and fetch linux-image-$(uname -r)-dbgsym (full symbols)"
	echo "  2) Extract current kernel with extract-vmlinux (no symbols)"
	echo ""

	read -p "[?] Which method do you want to use? (1/2): " method

	KERNEL_VER=$(uname -r)
	OUTPUT_DIR="$HOME/src/kernel-ubuntu"
	mkdir -p "$OUTPUT_DIR"

	case "$method" in
		1)
			echo "[*] Adding ddebs repositories for debug symbols..."
			UBUNTU_CODENAME=$(lsb_release -cs)
			sudo tee /etc/apt/sources.list.d/ddebs.list >/dev/null <<EOF
deb http://ddebs.ubuntu.com ${UBUNTU_CODENAME} main restricted universe multiverse
deb http://ddebs.ubuntu.com ${UBUNTU_CODENAME}-updates main restricted universe multiverse
deb http://ddebs.ubuntu.com ${UBUNTU_CODENAME}-security main restricted universe multiverse
EOF

			echo "[*] Installing ubuntu-dbgsym-keyring..."
			sudo apt install -y ubuntu-dbgsym-keyring

			echo "[*] Updating package list..."
			sudo apt update

			echo "[*] Installing linux-image-${KERNEL_VER}-dbgsym..."
			sudo apt install -y linux-image-${KERNEL_VER}-dbgsym || {
				echo "[!] Failed to install debug symbols."
				return
			}

			if [ -f "/usr/lib/debug/boot/vmlinux-${KERNEL_VER}" ]; then
				cp "/usr/lib/debug/boot/vmlinux-${KERNEL_VER}" "$OUTPUT_DIR/vmlinux-${KERNEL_VER}-dbgsym"
				echo "[+] vmlinux with debug symbols copied to $OUTPUT_DIR/vmlinux-${KERNEL_VER}-dbgsym"
			else
				echo "[!] Could not find /usr/lib/debug/boot/vmlinux-${KERNEL_VER}"
			fi
			;;

		2)
			VMLINUZ="/boot/vmlinuz-${KERNEL_VER}"
			if [ ! -f "$VMLINUZ" ]; then
				echo "[!] Kernel image not found at $VMLINUZ"
				return
			fi

			if [ ! -f "$OUTPUT_DIR/extract-vmlinux" ]; then
				echo "[*] Downloading extract-vmlinux script..."
				wget -q "$GLOBAL_URL_BOOTKITS_TOOLS_EXTRACT_VMLINUX" -O "$OUTPUT_DIR/extract-vmlinux"
				chmod +x "$OUTPUT_DIR/extract-vmlinux"
			fi

			echo "[*] Extracting vmlinux from $VMLINUZ..."
			sudo "$OUTPUT_DIR/extract-vmlinux" "$VMLINUZ" > "$OUTPUT_DIR/vmlinux-${KERNEL_VER}-extracted"

			if [ -s "$OUTPUT_DIR/vmlinux-${KERNEL_VER}-extracted" ]; then
				echo "[+] vmlinux extracted successfully: vmlinux-${KERNEL_VER}-extracted"
			else
				echo "[!] Extraction produced an empty file. The kernel may use an unsupported compression format."
				rm -f "$OUTPUT_DIR/vmlinux-${KERNEL_VER}-extracted"
			fi

			if [ -f "/boot/System.map-${KERNEL_VER}" ]; then
				sudo cp "/boot/System.map-${KERNEL_VER}" "$OUTPUT_DIR/" 2>/dev/null || true
				sudo chmod 644 "$OUTPUT_DIR/System.map-${KERNEL_VER}"
				echo "[+] System.map copied to $OUTPUT_DIR/"
			else
				echo "[!] Could not find /boot/System.map-${KERNEL_VER}"
			fi
			;;

		*)
			echo "[-] Invalid option. Aborting."
			;;
	esac

	echo "[*] Kernel prepared in $OUTPUT_DIR/"
}



# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionBootkitsREBootFiles {
	echo -e "\033[1;32m[!] You have selected the option 'Bootkits - RE -> Linux Boot Process [ESP + SHIM + GRUB + vmlinuz + vmlinux]'\033[0m"
	read -p "[?] Do you want to proceed? (Press 'Y'): " response
	if [[ "$response" != "Y" ]]; then
		echo "[-] Operation aborted."
		return
	fi

	# Administrator check
	if [[ "$EUID" -ne 0 ]]; then
		echo "[!] This option must be run as root. Please re-run with sudo."
		return
	fi

	# ABR_Bootkits_BootFiles
	LOCAL_FOLDER_BOOT_FILES="ABR_Bootkits_BootFiles"
	LOCAL_SCRIPT_DIR="$(pwd)"
	LOCAL_BOOT_FILES_PATH="$LOCAL_SCRIPT_DIR/$LOCAL_FOLDER_BOOT_FILES"

	if [ ! -d "$LOCAL_BOOT_FILES_PATH" ]; then
		mkdir -p "$LOCAL_BOOT_FILES_PATH"
		echo "[+] Created folder: $LOCAL_FOLDER_BOOT_FILES"
	fi

	KERNEL_VER=$(uname -r)

	# Mount ESP
	LOCAL_ESP_MOUNT="/boot/efi"
	LOCAL_ESP_MOUNTED_BY_US=false

	if mountpoint -q "$LOCAL_ESP_MOUNT"; then
		echo "[*] ESP already mounted at $LOCAL_ESP_MOUNT"
	else
		echo "[*] ESP not mounted. Attempting to detect and mount it..."
		LOCAL_ESP_DEVICE=$(lsblk -o NAME,PARTTYPE -rn | awk '/c12a7328-f81f-11d2-ba4b-00a0c93ec93b/ {print "/dev/"$1}' | head -n 1)
		if [ -z "$LOCAL_ESP_DEVICE" ]; then
			echo "[!] Could not auto-detect ESP partition. Make sure the EFI System Partition exists."
			return
		fi
		echo "[*] Detected ESP at: $LOCAL_ESP_DEVICE"
		mkdir -p "$LOCAL_ESP_MOUNT"
		mount "$LOCAL_ESP_DEVICE" "$LOCAL_ESP_MOUNT"
		LOCAL_ESP_MOUNTED_BY_US=true
		echo "[+] ESP mounted at $LOCAL_ESP_MOUNT"
	fi

	# shimx64.efi (/boot/efi/EFI/ubuntu/shimx64.efi)
	# LOCAL_SHIM_SRC=$(find "$LOCAL_ESP_MOUNT/EFI" -iname "shimx64.efi" -type f 2>/dev/null | head -n 1)
	LOCAL_SHIM_SRC="$LOCAL_ESP_MOUNT/EFI/ubuntu/shimx64.efi"
	if [ -f "$LOCAL_SHIM_SRC" ]; then
		cp "$LOCAL_SHIM_SRC" "$LOCAL_BOOT_FILES_PATH/shimx64.efi"
		echo "[+] Copied shimx64.efi from: $LOCAL_SHIM_SRC"
	else
		echo "[!] shimx64.efi not found at: $LOCAL_SHIM_SRC"
	fi

	# grubx64.efi (/boot/efi/EFI/ubuntu/grubx64.efi)
	# LOCAL_GRUB_EFI_SRC=$(find "$LOCAL_ESP_MOUNT/EFI" -iname "grubx64.efi" -type f 2>/dev/null | head -n 1)
	LOCAL_GRUB_EFI_SRC="$LOCAL_ESP_MOUNT/EFI/ubuntu/grubx64.efi"
	if [ -f "$LOCAL_GRUB_EFI_SRC" ]; then
		cp "$LOCAL_GRUB_EFI_SRC" "$LOCAL_BOOT_FILES_PATH/grubx64.efi"
		echo "[+] Copied grubx64.efi from: $LOCAL_GRUB_EFI_SRC"
	else
		echo "[!] grubx64.efi not found at: $LOCAL_GRUB_EFI_SRC"
	fi

	# grub.cfg (/boot/efi/EFI/ubuntu/grub.cfg or /boot/grub/grub.cfg)
	# LOCAL_GRUBCFG_SRC=$(find "$LOCAL_ESP_MOUNT/EFI" -iname "grub.cfg" -type f 2>/dev/null | head -n 1)
	LOCAL_GRUBCFG_SRC="$LOCAL_ESP_MOUNT/EFI/ubuntu/grub.cfg"
	if [ -f "$LOCAL_GRUBCFG_SRC" ]; then
		cp "$LOCAL_GRUBCFG_SRC" "$LOCAL_BOOT_FILES_PATH/grub.cfg"
		echo "[+] Copied grub.cfg from: $LOCAL_GRUBCFG_SRC"
	elif [ -f "/boot/grub/grub.cfg" ]; then
		cp "/boot/grub/grub.cfg" "$LOCAL_BOOT_FILES_PATH/grub.cfg"
		echo "[+] Copied grub.cfg from: /boot/grub/grub.cfg"
	else
		echo "[!] grub.cfg not found"
	fi

	# Unmount ESP if we mounted it
	if [ "$LOCAL_ESP_MOUNTED_BY_US" = true ]; then
		umount "$LOCAL_ESP_MOUNT"
		echo "[*] ESP unmounted from $LOCAL_ESP_MOUNT"
	fi

	# vmlinuz (running kernel)
	LOCAL_VMLINUZ_SRC="/boot/vmlinuz-${KERNEL_VER}"
	if [ -f "$LOCAL_VMLINUZ_SRC" ]; then
		cp "$LOCAL_VMLINUZ_SRC" "$LOCAL_BOOT_FILES_PATH/vmlinuz-${KERNEL_VER}"
		echo "[+] Copied vmlinuz-${KERNEL_VER}"
	else
		echo "[!] vmlinuz not found at: $LOCAL_VMLINUZ_SRC"
	fi

	# vmlinux (extract from vmlinuz using extract-vmlinux)
	LOCAL_EXTRACT_SCRIPT="$LOCAL_BOOT_FILES_PATH/extract-vmlinux"
	LOCAL_VMLINUX_DST="$LOCAL_BOOT_FILES_PATH/vmlinux-${KERNEL_VER}"
	if [ -f "$LOCAL_VMLINUZ_SRC" ]; then
		echo "[*] Downloading extract-vmlinux script..."
		wget -q "$GLOBAL_URL_BOOTKITS_TOOLS_EXTRACT_VMLINUX" -O "$LOCAL_EXTRACT_SCRIPT"
		chmod +x "$LOCAL_EXTRACT_SCRIPT"
		echo "[*] Extracting vmlinux from vmlinuz-${KERNEL_VER}..."
		"$LOCAL_EXTRACT_SCRIPT" "$LOCAL_VMLINUZ_SRC" > "$LOCAL_VMLINUX_DST"
		if [ -s "$LOCAL_VMLINUX_DST" ]; then
			echo "[+] vmlinux extracted successfully: vmlinux-${KERNEL_VER}"
		else
			echo "[!] Extraction produced an empty file. The kernel may use an unsupported compression format."
			rm -f "$LOCAL_VMLINUX_DST"
		fi
		rm -f "$LOCAL_EXTRACT_SCRIPT"
	else
		echo "[!] Skipping vmlinux extraction: vmlinuz not available"
	fi

	# initrd (running kernel)
	LOCAL_INITRD_SRC="/boot/initrd.img-${KERNEL_VER}"
	if [ -f "$LOCAL_INITRD_SRC" ]; then
		cp "$LOCAL_INITRD_SRC" "$LOCAL_BOOT_FILES_PATH/initrd.img-${KERNEL_VER}"
		echo "[+] Copied initrd.img-${KERNEL_VER}"
	else
		echo "[!] initrd.img not found at: $LOCAL_INITRD_SRC"
	fi

	# System.map
	LOCAL_SYSTEMMAP_SRC="/boot/System.map-${KERNEL_VER}"
	if [ -f "$LOCAL_SYSTEMMAP_SRC" ]; then
		cp "$LOCAL_SYSTEMMAP_SRC" "$LOCAL_BOOT_FILES_PATH/System.map-${KERNEL_VER}"
		echo "[+] Copied System.map-${KERNEL_VER}"
	else
		echo "[!] System.map not found at: $LOCAL_SYSTEMMAP_SRC"
	fi

	# Final message
	echo ""
	echo "[+] Operation completed. Files saved in $LOCAL_BOOT_FILES_PATH"
	echo -e "\033[1;90m[*] Load grubx64.efi, vmlinuz and vmlinux into Ghidra or IDA, resolve function signatures, and start reversing the Linux boot process.\033[0m"
}



# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionRootkitsRequirements {
	echo -e "\033[1;32m[!] You have selected the option 'Rootkits - Requirements -> linux-headers + libbpf'\033[0m"
	read -p "[?] Do you want to proceed? (Press 'Y'): " response
	if [[ "$response" == "Y" ]]; then
		echo "[*] Proceeding with installation..."
		sudo apt-get update
		sudo apt-get install -y build-essential linux-headers-$(uname -r) clang libbpf-dev
		echo "[+] Installation completed."
	else
		echo "[-] Operation aborted."
	fi
}



# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionRootkitsPoCs {
	echo -e "\033[1;32m[!] You have selected the option 'Rootkits - PoCs -> LKM Rootkits & eBPF Programs'\033[0m"
	read -p "[?] Do you want to proceed? (Press 'Y'): " response
	if [[ "$response" == "Y" ]]; then

		# ABR_Rootkits_PoCs
		LOCAL_FOLDER_ROOTKITS_POCS="ABR_Rootkits_PoCs"

		if [ ! -d "$LOCAL_FOLDER_ROOTKITS_POCS" ]; then
			mkdir -p "$LOCAL_FOLDER_ROOTKITS_POCS"
			echo "[+] Created folder: $LOCAL_FOLDER_ROOTKITS_POCS"
		fi

		echo ""
		echo "[*] In earlier versions of this section, PoCs were embedded as base64 blobs decoded and saved to disk."
		echo "[*] Over time they've been organized into GitHub repositories, making it much easier to clone and explore them."
		echo "[*] These repositories are ideal for beginners who want to understand how Kernel-Mode Modules work in the context of Rootkits and low-level malware."
		echo ""

		# Rootkits Development Starter Pack
		LOCAL_STARTER_PATH="$LOCAL_FOLDER_ROOTKITS_POCS/Rootkits-Development-Starter-Pack"
		if [ ! -d "$LOCAL_STARTER_PATH" ]; then
			read -p "[?] Do you want to clone the 'Rootkits Development Starter Pack' repository? (Y/N): " clone
			if [[ "$clone" == "Y" ]]; then
				git clone "$GLOBAL_URL_MY_REPOSITORY_ROOTKITS_STARTER_PACK" "$LOCAL_STARTER_PATH"
				echo "[+] Repository cloned successfully. You'll find basic Rootkit PoCs inside the 'Rootkits' folder."
			fi
		else
			echo "[!] The folder '$LOCAL_STARTER_PATH' already exists. Unable to proceed."
		fi

		# Gillyweed (Linux LKM Rootkit)
		LOCAL_GILLYWEED_PATH="$LOCAL_FOLDER_ROOTKITS_POCS/Gillyweed"
		if [ ! -d "$LOCAL_GILLYWEED_PATH" ]; then
			read -p "[?] Do you want to clone the Gillyweed (Linux LKM Rootkit) repository? (Y/N): " clone
			if [[ "$clone" == "Y" ]]; then
				git clone --recurse-submodules "$GLOBAL_URL_MY_REPOSITORY_ROOTKIT_GILLYWEED" "$LOCAL_GILLYWEED_PATH"
				echo "[+] Repository cloned successfully. The 'GillyweedRootkit' folder contains a fully functional Linux LKM Rootkit."
			fi
		else
			echo "[!] The folder '$LOCAL_GILLYWEED_PATH' already exists. Unable to proceed."
		fi

		# Liminalis (Linux eBPF Rootkit)
		LOCAL_LIMINALIS_PATH="$LOCAL_FOLDER_ROOTKITS_POCS/Liminalis"
		if [ ! -d "$LOCAL_LIMINALIS_PATH" ]; then
			read -p "[?] Do you want to clone the Liminalis (Linux eBPF Rootkit) repository? (Y/N): " clone
			if [[ "$clone" == "Y" ]]; then
				git clone --recurse-submodules "$GLOBAL_URL_MY_REPOSITORY_ROOTKIT_LIMINALIS" "$LOCAL_LIMINALIS_PATH"
				echo "[+] Repository cloned successfully. The 'LiminalisRootkit' folder contains a fully functional Linux eBPF Rootkit."
			fi
		else
			echo "[!] The folder '$LOCAL_LIMINALIS_PATH' already exists. Unable to proceed."
		fi

		echo ""
		echo "[*] For more Proof-of-Concepts, check out the following repository:"
		echo "   * Awesome Bootkits & Rootkits Resources"
		echo "      -> Compilation of hundreds of resources, guides, videos, and more"
		echo "        $GLOBAL_URL_MY_REPOSITORY_AWESOME"
		echo ""
	else
		echo "[-] Operation aborted."
	fi
}



# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionResourcesMyRepositories {
	echo -e "\033[1;32m[!] You have selected the option 'Resources - My Repositories -> A compilation of resources dedicated to bootkit and rootkit development'\033[0m"
	read -p "[?] Do you want to proceed? (Press 'Y'): " response
	if [[ "$response" == "Y" ]]; then
		echo ""
		echo "[+] My Resources and Repositories related to Bootkits & Rootkits:"
		echo ""
		echo "   * Bootkits & Rootkits Development Environment"
		echo "      -> Scripts to automate the development environment setup"
		echo "        $GLOBAL_URL_MY_REPOSITORY_ENVIRONMENT"
		echo ""
		echo "   * Awesome Bootkits & Rootkits Resources"
		echo "      -> Compilation of hundreds of resources, guides, videos, and more"
		echo "        $GLOBAL_URL_MY_REPOSITORY_AWESOME"
		echo ""
		echo "   * Bootkits & Rootkits Timeline"
		echo "      -> Curated timeline of bootkits and rootkits observed in the wild"
		echo "        $GLOBAL_URL_MY_REPOSITORY_BOOTKITS_ROOTKITS_TIMELINE"
		echo ""
		echo "   * Bootkits Development Starter Pack"
		echo "      -> Basic UEFI bootkit PoCs built on top of EDK2"
		echo "        $GLOBAL_URL_MY_REPOSITORY_BOOTKITS_STARTER_PACK"
		echo ""
		echo "   * Rootkits Development Starter Pack"
		echo "      -> Basic LKM and kernel-mode rootkit PoCs"
		echo "        $GLOBAL_URL_MY_REPOSITORY_ROOTKITS_STARTER_PACK"
		echo ""
		echo "   * Abyss - UEFI Bootkit (Windows)"
		echo "      -> A UEFI-based bootkit targeting the Windows boot chain"
		echo "        $GLOBAL_URL_MY_REPOSITORY_BOOTKIT_ABYSS"
		echo ""
		echo "   * Antarctic - UEFI Bootkit (Linux)"
		echo "      -> A UEFI-based bootkit targeting the Linux boot chain"
		echo "        $GLOBAL_URL_MY_REPOSITORY_BOOTKIT_ANTARCTIC"
		echo ""
		echo "   * Gillyweed - Linux LKM Rootkit"
		echo "      -> A loadable kernel module rootkit for Linux kernel internals research"
		echo "        $GLOBAL_URL_MY_REPOSITORY_ROOTKIT_GILLYWEED"
		echo ""
		echo "   * Liminalis - Linux eBPF Rootkit"
		echo "      -> An eBPF-based rootkit for Linux tracing and kernel observability abuse"
		echo "        $GLOBAL_URL_MY_REPOSITORY_ROOTKIT_LIMINALIS"
		echo ""
		echo "   * UEFI Firmware Analysis"
		echo "      -> UEFI firmware analysis and research on known vulnerabilities in early boot components"
		echo "        $GLOBAL_URL_MY_REPOSITORY_UEFI_FIRMWARE_ANALYSIS"
		echo ""
		echo "   * UEFI Vulnerability Research and Exploit Development"
		echo "      -> Research hub for real-world UEFI vulnerabilities and pre-boot attack primitives"
		echo "        $GLOBAL_URL_MY_REPOSITORY_UEFI_VULNERABILITY_RESEARCH"
		echo ""
		echo "   * Debugging UEFI Applications for Vulnerability Research and Malware Analysis"
		echo "      -> Documentation and tooling for debugging UEFI applications in pre-OS environments"
		echo "        $GLOBAL_URL_MY_REPOSITORY_DEBUGGING_UEFI"
		echo ""
		echo "   * Awesome Bring Your Own Vulnerable UEFI Application"
		echo "      -> Curated collection of UEFI vulnerabilities and exploitation techniques for bootkit installation"
		echo "        $GLOBAL_URL_MY_REPOSITORY_AWESOME_BYOVUA"
		echo ""
		echo "   * QEMU UEFI Research Environment"
		echo "      -> QEMU/OVMF-based lab with Secure Boot key enrollment and EFI signing workflow"
		echo "        $GLOBAL_URL_MY_REPOSITORY_QEMU_UEFI_RESEARCH"
		echo ""
		echo "   * VMware Secure Boot Custom Keys"
		echo "      -> VMware environment for enrolling custom PK/KEK/DB and signing EFI binaries"
		echo "        $GLOBAL_URL_MY_REPOSITORY_VMWARE_SECURE_BOOT"
		echo ""
		echo "[+] All repositories are public. Enjoy!"
	else
		echo "[-] Operation aborted."
	fi
}



# ---------------------------------------------------------------------------------------------------------------------------------------------------------
while true; do
	ShowMenu
	read -p "Choose an option: " choice
	case "$choice" in
		1a|1A) OptionBootkitsRequirements ;;
		1b|1B) OptionBootkitsSetUp ;;
		1c|1C) OptionBootkitsTools ;;
		1d|1D) OptionBootkitsPoCs ;;
		1e|1E) OptionBootkitsKeys ;;
		1f|1F) OptionBootkitsREGRUB ;;
		1g|1G) OptionBootkitsREKernel ;;
		1h|1H) OptionBootkitsREBootFiles ;;
		3a|3A) OptionRootkitsRequirements ;;
		3b|3B) OptionRootkitsPoCs ;;
		4a|4A) OptionResourcesMyRepositories ;;
		q|Q) echo "[*] Exiting..."; break ;;
		*) echo "[!] Invalid option. Please choose again." ;;
	esac
	echo ""
	read -p "Press ENTER to continue..."
done



# ---------------------------------------------------------------------------------------------------------------------------------------------------------
