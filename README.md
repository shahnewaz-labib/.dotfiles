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

### Audio
```bash 
pacman -S alsamixer pavucontrol
```

### PDF and ePUB
```bash
pacman -S evince foliate
```
