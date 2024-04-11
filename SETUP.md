# SSH Setup

- Generate SSH Key
  ```sh
  ssh-keygen -t ed25519 -f <ssh_file_name> -C <EMAIL_STRING>
  ssh-agent -s
  ssh-add .ssh/<ssh_file_name_alt_account>
  ```
- Setup SSH Key to Github
- Create ssh config file (Default: ~/.ssh/config)

  ```
  Host github.com
      HostName github.com
      User git
      IdentityFile ~/.ssh/<ssh_file_name>
      IdentitiesOnly yes

  Host github.com-alt
      HostName github.com
      User git
      IdentityFile ~/.ssh/<ssh_file_name_alt>
      IdentitiesOnly yes
  ```

# Virtual Machine Setup
Install required packages (packages/arch/virtualization.lst)

Start Service
```
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
```

Uncomment two line in /etc/libvirt/libvirtd.conf
```
unix_sock_group = "libvirt"
unix_sock_ro_perms = "0777"
```

Add user account to libvirt group
```
sudo usermod -a -G kvm,libvirt $(whoami)
```

Auto start virtual machine network
```
sudo firewall-cmd --add-service=libvirt --permanent
sudo virsh net-autostart default
```
Then reboot system.

# Wifi driver fix
```
paru -S rtl8821ce-dkms-git
```

# Sync dual-boot bluetooth devices
```
paru -S python-pipx chntpw
pipx install bt-dualboot
sudo ~/.local/bin/bt-dualboot --sync-all --backup
```

# Windows doesn't appear on boot menu list
```
sudo mkdir /mnt/linux-efi /mnt/windows-efi
sudo fdisk -l
sudo mount /dev/<Windows-EFI-DEVICE-NAME> /mnt/window-sefi/
sudo mount /dev/<Linux-EFI-DEVICE-NAME> /mnt/linux-efi/
sudo cp -r /mnt/windows-efi/EFI/Microsoft /mnt/linux-efi/EFI/
sudo umount /mnt/linux-efi /mnt/windows-efi
```

# External storage mount option
```
LABEL=Linux-HDD                             /mnt/linux-hdd   ext4    defaults,nofail,x-gvfs-show,x-gvfs-name=Linux-HDD                                          0 0 
LABEL=HDD                                   /mnt/hdd         ntfs3   defaults,nofail,uid=1000,gid=1000                                                          0 0
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

# Plasma Google Drive Fix Workaround
`sudo -e /usr/share/accounts/providers/kde/google.provider`
Replace content with
```
<?xml version="1.0" encoding="UTF-8"?>
<provider id="google">
  <name>Google</name>
  
  <description>GNOME-ID, Google Drive and YouTube</description>
  <icon>im-google</icon>
  <translations>kaccounts-providers</translations>
  <domains>.*google\.com</domains>

  <template>
    <group name="auth">
      <setting name="method">oauth2</setting>
      <setting name="mechanism">web_server</setting>
      <group name="oauth2">
        <group name="web_server">
          <setting name="Host">accounts.google.com</setting>
          <setting name="AuthPath">o/oauth2/auth?access_type=offline</setting>
          <setting name="TokenPath">o/oauth2/token</setting>
          <setting name="RedirectUri">http://localhost/oauth2callback</setting>
          
          <setting name="ResponseType">code</setting>
          <setting type="as" name="Scope">[
              'https://www.googleapis.com/auth/userinfo.email',
              'https://www.googleapis.com/auth/userinfo.profile',
              'https://www.googleapis.com/auth/calendar',
              'https://www.googleapis.com/auth/tasks',
              'https://www.googleapis.com/auth/drive'
          ]</setting>
          <setting type="as" name="AllowedSchemes">['https']</setting>
          <setting name="ClientId">44438659992-7kgjeitenc16ssihbtdjbgguch7ju55s.apps.googleusercontent.com</setting>
          <setting name="ClientSecret">-gMLuQyDiI0XrQS_vx_mhuYF</setting>
          <setting type="b" name="ForceClientAuthViaRequestBody">true</setting>
        </group>
      </group>
    </group>
  </template>
</provider>
```
