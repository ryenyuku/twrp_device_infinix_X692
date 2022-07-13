# TWRP device tree for Infinix Note 8 (X692)

## Status

Current state of features (from [here](https://twrp.me/faq/OfficialMaintainer.html)):

Blocking checks
- [X] Correct screen/recovery size
- [X] Working Touch, screen
- [X] Backup to internal/microSD
- [X] Restore from internal/microSD
- [X] reboot to system
- [X] ADB



Medium checks
- [X] update.zip sideload
- [X] UI colors (red/blue inversions)
- [X] Screen goes off and on
- [X] F2FS/EXT4 Support, exFAT/NTFS where supported
- [X] all important partitions listed in mount/backup lists
- [ ] backup/restore to/from external (USB-OTG) storage (not tested)
- [X] backup/restore to/from adb (https://gerrit.omnirom.org/#/c/15943/)
- [X] decrypt /data
- [X] Correct date


Minor checks
- [X] MTP export
- [X] reboot to bootloader
- [X] reboot to recovery
- [X] poweroff
- [X] battery level
- [X] temperature
- [X] encrypted backups
- [ ] input devices via USB (USB-OTG) - keyboard, mouse and disks (not tested)
- [X] USB mass storage export
- [X] set brightness
- [X] vibrate
- [X] screenshot
- [X] partition SD card

## Building

### Requirements:
- A GNU or GNU/Linux system (other non-GNU systems aren't guaranteed to work)
- At least 60GiB of free storage space
- Non-metered internet connection

### Steps:

#### Install all of the required dependencies 

  - Debian/Ubuntu
  ```
  sudo apt install bc build-essential zip curl libstdc++6 git wget python3 python-is-python3 gcc clang libssl-dev repo rsync flex bison aria2
  ```

#### Clone the repository and build with automated script
```
git clone https://github.com/ryenyuku/twrp_infx692_buildscripts.git
cd twrp_infx692_buildscripts
build/build.sh
```
