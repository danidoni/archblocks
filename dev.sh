#!/bin/bash
# ------------------------------------------------------------------------
# archblocks - minimal, modular, manual Arch Linux install script
# ------------------------------------------------------------------------
# es@ethanschoonover.com @ethanschoonover http://github.com/altercation/archblocks

# INSTRUCTIONS -----------------------------------------------------------
# boot into Arch Install media and run (for this script only):
#
# curl https://raw.github.com/altercation/archblocks/master/sample_laptop.sh" > install.sh
#     (...manually review the code! look at the blocks in the repo, then...)
# bash install.sh

echo "WARNING: DEV INSTALLER"

# RESPOSITORY ------------------------------------------------------------
REMOTE=https://raw.github.com/danidoni/archblocks/master

# CONFIG -----------------------------------------------------------------
HOSTNAME=tatil
USERNAME=dani
USERSHELL=/bin/bash
FONT=Lat2-Terminus16
FONT_MAP=8859-1_to_uni
LANGUAGE=en_US.UTF-8
KEYMAP=es
TIMEZONE=Europe/Madrid
MODULES="dm_mod dm_crypt aes_x86_64 ext2 ext4 vfat drm"
#HOOKS="base udev autodetect pata scsi sata usb usbinput consolefont encrypt filesystems fsck shutdown"
# possible fix for occasional blank screen on resume? https://wiki.archlinux.org/index.php/Pm-utils#Blank_screen_issue
HOOKS="base udev autodetect pata scsi sata usb usbinput consolefont encrypt filesystems fsck shutdown"


INSTALL_DRIVE=/dev/sda # "/dev/sda" "query" or blank (blank is the same as "query")

# BLOCKS -----------------------------------------------------------------
TIME=common/time_chrony_utc
FILESYSTEM=filesystem/gpt_luks_passphrase_ext4
BOOTLOADER=bootloader/efi_gummiboot
NETWORK=network/wired_wireless_default

# EXECUTE ----------------------------------------------------------------
. <(curl -fsL "${REMOTE}/blocks/_lib/helpers.sh"); _loadblock "_lib/core"

