# TWRP device tree for Infinix Note 8 (X692)

**WARNING: This port is still in testing phase**

## Status

Current state of features (from [here](https://twrp.me/faq/OfficialMaintainer.html)):

Blocking checks
- [X] Correct screen/recovery size
- [X] Working Touch, screen (partial, offset touch screen)
- [X] Backup to internal/microSD
- [X] Restore from internal/microSD
- [X] reboot to system
- [ ] ADB



Medium checks
- [ ] update.zip sideload
- [X] UI colors (red/blue inversions)
- [X] Screen goes off and on
- [X] F2FS/EXT4 Support, exFAT/NTFS where supported
- [X] all important partitions listed in mount/backup lists
- [ ] backup/restore to/from external (USB-OTG) storage (not tested)
- [ ] backup/restore to/from adb (https://gerrit.omnirom.org/#/c/15943/)
- [X] decrypt /data
- [X] Correct date


Minor checks
- [ ] MTP export
- [X] reboot to bootloader
- [X] reboot to recovery
- [X] poweroff
- [X] battery level
- [X] temperature
- [ ] encrypted backups
- [ ] input devices via USB (USB-OTG) - keyboard, mouse and disks (not tested)
- [ ] USB mass storage export
- [X] set brightness
- [X] vibrate
- [X] screenshot
- [X] partition SD card

## Building

Instruction is coming soon
