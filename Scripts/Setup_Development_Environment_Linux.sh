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
# Bootkits Setup
GLOBAL_URL_BOOTKITSSETUP_EDK2="https://github.com/tianocore/edk2"



# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function ShowMenu {
	clear
	echo "=============================================================================================="
	echo "Overview:"
	echo " - Bash Script for Automating Bootkits/Rootkits Development Environment Setup in Linux"
	echo "Note:"
	echo " - All options have been tested on Ubuntu 22.04 LTS"
	echo "LinkedIn:"
	echo " - $GLOBAL_URL_MY_LINKEDIN"
	echo "Github:"
	echo " - $GLOBAL_URL_MY_REPOSITORY"
	echo "=============================================================================================="
	echo ""
	echo "------------------------------------------- MENU ---------------------------------------------"
	echo " BOOTKITS"
	echo "	1a. Bootkits   - Requirements              -> GCC + Git + Python + NASM + ASL"
	echo "	1b. Bootkits   - Set Up Environment        -> EDK2"
	echo "	1c. Bootkits   - Tools                     -> OpenSSL + efitools + sbsigntools"
	echo "	1d. Bootkits   - Create Keys               -> Generate UEFI test keys and certificates"
	echo ""
	echo " ROOTKITS"
	echo "	3a. Rootkits   - Requirements              -> Kernel headers"
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
		sudo apt-get install -y build-essential uuid-dev iasl nasm git python-is-python3
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

	read -p "[?] Do you want to clone the EDK2 repository with submodules? (Y/N): " confirm_clone
	if [[ "$confirm_clone" == "Y" ]]; then
		if [ ! -d "$LOCAL_EDK2_SRC_DIR" ]; then
			echo "[*] Creating base directory and cloning EDK2 repository with submodules..."
			mkdir -p "$(dirname "$LOCAL_EDK2_SRC_DIR")"
			cd "$(dirname "$LOCAL_EDK2_SRC_DIR")"
			git clone --recurse-submodules "$GLOBAL_URL_BOOTKITSSETUP_EDK2" "$LOCAL_EDK2_SRC_DIR"
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

	read -p "[?] Do you want to initialize submodules? (Y/N): " confirm
	if [[ "$confirm" == "Y" ]]; then
		git submodule update --init
		echo "[+] Submodules initialized."
	else
		echo "[-] Skipped submodule initialization."
	fi

	read -p "[?] Do you want to build BaseTools? (Y/N): " confirm
	if [[ "$confirm" == "Y" ]]; then
		make -C BaseTools
		echo "[+] BaseTools built."
	else
		echo "[-] Skipped BaseTools build."
	fi

	read -p "[?] Do you want to source edksetup.sh with BaseTools? (Y/N): " confirm
	if [[ "$confirm" == "Y" ]]; then
		export EDK_TOOLS_PATH="$LOCAL_EDK2_SRC_DIR/BaseTools"
		. edksetup.sh BaseTools
		echo "[+] Environment sourced."
	else
		echo "[-] Skipped sourcing edksetup.sh."
	fi

	read -p "[?] Do you want to modify Conf/target.txt? (Y/N): " confirm
	if [[ "$confirm" == "Y" ]]; then
		sed -i 's|^ACTIVE_PLATFORM.*|ACTIVE_PLATFORM = MdeModulePkg/MdeModulePkg.dsc|' Conf/target.txt
		sed -i 's/^TOOL_CHAIN_TAG.*/TOOL_CHAIN_TAG = GCC5/' Conf/target.txt
		sed -i 's/^TARGET_ARCH.*/TARGET_ARCH = X64/' Conf/target.txt
		# Uncomment to enable multi-threaded builds (optional)
		# sed -i 's/^MAX_CONCURRENT_THREAD_NUMBER.*/MAX_CONCURRENT_THREAD_NUMBER = 9/' Conf/target.txt
		echo "[+] Conf/target.txt updated."
	else
		echo "[-] Skipped editing Conf/target.txt."
	fi

	read -p "[?] Do you want to build MdeModulePkg now? (Y/N): " confirm
	if [[ "$confirm" == "Y" ]]; then
		build

		LOCAL_HELLO_EFI_SRC="$LOCAL_EDK2_SRC_DIR/Build/MdeModule/DEBUG_GCC5/X64/HelloWorld.efi"
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
		sudo apt-get install -y openssl efitools sbsigntool mtools curl
		echo "[+] OpenSSL, efitools and sbsigntools installed."
	else
		echo "[-] Operation aborted."
	fi
}



# ---------------------------------------------------------------------------------------------------------------------------------------------------------
function OptionBootkitsCreateKeys {
	echo -e "\033[1;32m[!] You have selected the option 'Bootkits - Create Keys -> Generate UEFI test keys and certificates'\033[0m"

	for cmd in openssl cert-to-efi-sig-list sign-efi-sig-list sbsign sbverify mtools curl; do
		if ! command -v "$cmd" &>/dev/null; then
			echo "[!] Required tool '$cmd' is not installed. Please install it before proceeding."
			return
		fi
	done

	LOCAL_PK_SUBJ="/CN=TheMalwareGuardian PK/"
	LOCAL_KEK_SUBJ="/CN=TheMalwareGuardian KEK/"
	LOCAL_DB_SUBJ="/C=ES/ST=Galicia/L=Vilalba/O=The Malware Guardian/OU=Bootkits Department/CN=TheMalwareGuardian DB/"

	LOCAL_EDK2_SRC_DIR="$HOME/src/edk2"
	LOCAL_CERT_DIR="$LOCAL_EDK2_SRC_DIR/KeysAndCertificates"
	LOCAL_HELLO_EFI_SRC="$LOCAL_EDK2_SRC_DIR/Build/MdeModule/DEBUG_GCC5/X64/HelloWorld.efi"
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
	read -p "[?] Do you want to generate test PK, KEK, and DB certificates? (Y/N): " response
	if [[ "$response" == "Y" || "$response" == "y" ]]; then

		echo "[*] Generating Platform Key (PK)..."
		openssl req -new -x509 -newkey rsa:2048 -keyout pk.key -out pk.crt -nodes -days 3650 -subj "$LOCAL_PK_SUBJ"
		openssl x509 -in pk.crt -outform DER -out pk.cer

		echo "[*] Generating Key Exchange Key (KEK)..."
		openssl req -new -newkey rsa:2048 -keyout kek.key -out kek.csr -nodes -subj "$LOCAL_KEK_SUBJ"
		openssl x509 -req -in kek.csr -days 3650 -CA pk.crt -CAkey pk.key -CAcreateserial -out kek.crt
		openssl x509 -in kek.crt -outform DER -out kek.cer

		echo "[*] Generating Signature Database (DB)..."
		openssl req -new -newkey rsa:2048 -keyout db.key -out db.csr -nodes -subj "$LOCAL_DB_SUBJ"
		openssl x509 -req -in db.csr -days 3650 -CA kek.crt -CAkey kek.key -CAcreateserial -out db.crt
		openssl x509 -in db.crt -outform DER -out db.cer

		echo "[*] Exporting certificates to ESL and AUTH formats..."
		cert-to-efi-sig-list pk.crt pk.esl
		sign-efi-sig-list -k pk.key -c pk.crt PK pk.esl pk.auth

		cert-to-efi-sig-list kek.crt kek.esl
		sign-efi-sig-list -k pk.key -c pk.crt KEK kek.esl kek.auth

		cert-to-efi-sig-list db.crt db.esl
		sign-efi-sig-list -k kek.key -c kek.crt db db.esl db.auth

		if [ -f "$LOCAL_HELLO_EFI_SRC" ]; then
			echo "[*] Copying original HelloWorld.efi..."
			cp "$LOCAL_HELLO_EFI_SRC" "$LOCAL_HELLO_EFI_ORIGINAL"

			echo "[*] Found HelloWorld.efi. Signing with DB key..."
			sbsign --key db.key --cert db.crt --output "$LOCAL_HELLO_EFI_SIGNED" "$LOCAL_HELLO_EFI_SRC"

			echo "[*] Verifying signature..."
			sbverify --list "$LOCAL_HELLO_EFI_SIGNED"
			echo "[+] Signed binary: $LOCAL_HELLO_EFI_SIGNED"
		else
			echo "[!] HelloWorld.efi not found at: $LOCAL_HELLO_EFI_SRC"
			echo "[-] Skipping signing step."
		fi

		echo -e "\n[+] Certificates generated in: $LOCAL_CERT_DIR"
	else
		echo "[-] Keys generation skipped."
	fi

	# EFI Tools
	read -p "[?] Do you want to search and copy EFI files like shimx64.efi, KeyTool.efi, MokManager.efi, and Shell.efi? (Y/N): " efi_response
	if [[ "$efi_response" == "Y" || "$efi_response" == "y" ]]; then

		echo "[*] Searching for KeyTool.efi..."
		KEYTOOL_PATH=$(find / \( -path /mnt -o -path /proc -o -path /sys \) -prune -false -o -iname "KeyTool.efi" -type f -print 2>/dev/null | head -n 1)
		if [ -n "$KEYTOOL_PATH" ]; then
			cp "$KEYTOOL_PATH" "$LOCAL_CERT_DIR/KeyTool.efi"
			echo "[+] Copied KeyTool.efi from: $KEYTOOL_PATH"
		else
			echo "[!] KeyTool.efi not found"
		fi

		echo "[*] Searching for shimx64.efi..."
		SHIM_PATH=$(find / \( -path /mnt -o -path /proc -o -path /sys \) -prune -false -o -iname "shimx64.efi" -type f -print 2>/dev/null | head -n 1)
		if [ -n "$SHIM_PATH" ]; then
			cp "$SHIM_PATH" "$LOCAL_CERT_DIR/shimx64.efi"
			echo "[+] Copied shimx64.efi from: $SHIM_PATH"
		else
			echo "[!] shimx64.efi not found"
		fi

		echo "[*] Searching for MokManager.efi..."
		MMX_PATH=$(find / \( -path /mnt -o -path /proc -o -path /sys \) -prune -false -o -iname "mmx64.efi" -type f -print 2>/dev/null | head -n 1)
		if [ -n "$MMX_PATH" ]; then
			cp "$MMX_PATH" "$LOCAL_CERT_DIR/mmx64.efi"
			echo "[+] Copied MokManager.efi from: $MMX_PATH"
		else
			echo "[!] MokManager.efi not found"
		fi

		echo "[*] Searching for Shell.efi..."
		SHELL_PATH=$(find / \( -path /mnt -o -path /proc -o -path /sys \) -prune -false -o -iname "Shell.efi" -type f -print 2>/dev/null | head -n 1)
		if [ -n "$SHELL_PATH" ]; then
			cp "$SHELL_PATH" "$LOCAL_CERT_DIR/Shell.efi"
			echo "[+] Copied Shell.efi from: $SHELL_PATH"
		else
			echo "[!] Shell.efi not found"
		fi

	else
		echo "[-] EFI tools copy skipped."
	fi

	# Microsoft Keys
	read -p "[?] Do you want to download Microsoft public UEFI certificates? (Y/N): " ms_response
	if [[ "$ms_response" == "Y" || "$ms_response" == "y" ]]; then
		echo "[*] Downloading Microsoft public UEFI certificates..."

		curl -L -o "$LOCAL_CERT_DIR/Windows_OEM_Devices_PK.cer" https://go.microsoft.com/fwlink/?linkid=2255361
		curl -L -o "$LOCAL_CERT_DIR/Microsoft_Corporation_KEK2K_CA_2023_KEK.cer" https://go.microsoft.com/fwlink/?linkid=2239775
		curl -L -o "$LOCAL_CERT_DIR/Microsoft_UEFI_CA_2023_DB.cer" https://go.microsoft.com/fwlink/?linkid=2239872
		curl -L -o "$LOCAL_CERT_DIR/Microsoft_Corporation_UEFI_CA_2011_DB.cer" https://go.microsoft.com/fwlink/p/?linkid=321194
		curl -L -o "$LOCAL_CERT_DIR/Microsoft_Option_ROM_UEFI_CA_2023_DB.cer" https://go.microsoft.com/fwlink/?linkid=2284009
		curl -L -o "$LOCAL_CERT_DIR/Windows_UEFI_CA_2023_DB.cer" https://go.microsoft.com/fwlink/?linkid=2239776

		echo "[+] Microsoft certificates downloaded to: $LOCAL_CERT_DIR"
	else
		echo "[-] Microsoft certificates download skipped."
	fi

	# FAT32 Disk
	read -p "[?] Do you want to create a FAT32 disk image with all the files for QEMU/OVMF testing? (Y/N): " disk_response
	if [[ "$disk_response" == "Y" || "$disk_response" == "y" ]]; then
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

		echo "[*] Copying files into image..."
		find "$LOCAL_CERT_DIR" -maxdepth 1 -type f ! -name "efi_disk.img" -exec sudo cp {} "$MNT_DIR" \;

		echo "[*] Syncing and unmounting..."
		sync
		sudo umount "$MNT_DIR"
		sudo losetup -d "$LOOP_DEVICE"

		echo "[*] Copying final image to: $FINAL_IMG"
		cp "$IMG_PATH" "$FINAL_IMG"

		echo "[+] FAT32 image created successfully: $FINAL_IMG"
	else
		echo "[-] FAT32 image creation skipped."
	fi

	# Sign all EFI tools
	read -p "[?] Do you want to sign all EFI tools found in $LOCAL_CERT_DIR with the DB key? (Y/N): " sign_all_response
	if [[ "$sign_all_response" == "Y" || "$sign_all_response" == "y" ]]; then
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
function OptionRootkitsRequirements {
	echo -e "\033[1;32m[!] You have selected the option 'Rootkits - Requirements -> Kernel headers'\033[0m"
	read -p "[?] Do you want to proceed? (Press 'Y'): " response
	if [[ "$response" == "Y" ]]; then
		echo "[*] Proceeding with installation..."
		sudo apt-get update
		sudo apt-get install -y build-essential linux-headers-$(uname -r)
		echo "[+] Installation completed."
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
		1d|1D) OptionBootkitsCreateKeys ;;
		3a|3A) OptionRootkitsRequirements ;;
		q|Q) echo "[*] Exiting..."; break ;;
		*) echo "[!] Invalid option. Please choose again." ;;
	esac
	echo ""
	read -p "Press ENTER to continue..."
done



# ---------------------------------------------------------------------------------------------------------------------------------------------------------
