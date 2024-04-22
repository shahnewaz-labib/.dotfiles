# .dotfiles
## Installer
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/shahnewaz-labib/.dotfiles/main/install.sh)"
```

### Discord
In `~/.config/discord/settings.json`:
```json
{
  "SKIP_HOST_UPDATE": true,
  "IS_MAXIMIZED": false,
  "IS_MINIMIZED": false,
  "WINDOW_BOUNDS": {
    "x": 7,
    "y": 32,
    "width": 1906,
    "height": 1041
  }
}
```

### Annoying kwallet thingy
In `~/.config/kwalletrc`:
```
[Migration]
alreadyMigrated=true
[Wallet]
Enabled=false
```

### Audio & Bluetooth
```bash 
pacman -S (alsamixer)? pavucontrol
pacman -S pulseaudio-alsa pavucontrol
pacman -S bluez bluez-utils blueman
systemctl enable --start bluetooth.service
pulseaudio --check
pulseaudio -D
```

### Enable tap, natural scrolling
In `/etc/X11/xorg.conf.d/30-touchpad.conf`:
```
Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "NaturalScrolling" "true"
EndSection
```

### PDF and ePUB
```bash
pacman -S evince foliate
```

### On lid close, do nothing
In `/etc/systemd/logind.conf`:
```
HandleLidSwitch=ignore
```
