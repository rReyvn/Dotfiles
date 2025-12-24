# Sync dual-boot bluetooth devices
```
paru -S python-pipx chntpw
pipx install bt-dualboot
sudo ~/.local/bin/bt-dualboot --sync-all --backup
```

# Secure Boot Setup
```
paru -S sbctl
```
Reboot to firmware setting and clear secure boot key then boot to linux
```
sudo sbctl status
sudo sbctl create-keys
sudo sbctl enroll-keys -m
sudo sbctl status
```
Sign kernel image & boot loader
```
sudo sbctl verify
sudo sbctl-batch-sign
sudo sbctl sign -s -o /usr/lib/systemd/boot/efi/systemd-bootx64.efi.signed /usr/lib/systemd/boot/efi/systemd-bootx64.efi
sudo sbctl verify
```
If everything done, reboot to firmware setting again and turn secure boot on then test it by booting into linux

# Silent Boot
Add this to kernel parameter
```
quiet loglevel=3 systemd.show_status=auto rd.udev.log_level=3
```
Regenerate all systemd-boot entries
`sudo sdboot-manage gen`
