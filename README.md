# .dotfiles

[Old neovim config](https://github.com/shahnewaz-labib/.dotfiles/tree/82d14383c23116005b9e66654408c80a7d93a934/nvim/.config/nvim)

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

```ini
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

```conf
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

```conf
HandleLidSwitch=ignore
```
