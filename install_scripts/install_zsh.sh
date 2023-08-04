#!/bin/bash

dependencies=("zsh" "fzf")

for dependency in "${dependencies[@]}"
do 
    [ -n "$(pacman -Qs $dependency)" ] && echo "$dependency is already installed..." || echo "[+] Installing $dependency..." && sudo pacman -S --noconfirm $dependency; 
done

echo "[+] Installing ohmyzsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "[+] Installing zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

echo "[+] Installing zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
