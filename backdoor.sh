#!/bin/bash

USER=$(whoami)
HOME_DIR="/home/$USER"
CURRENT_DIR=$(pwd)

# moving folders
move_folder() {
    SRC="$1"
    DEST="$2"
    if [ -d "$SRC" ]; then
        echo "moving $SRC to $DEST..."
        # sudo mkdir -p "$DEST"
        sudo cp -r "$SRC" "$DEST"
    else
        echo "the $SRC folder does not exist"
    fi
}

move_folder "$CURRENT_DIR/.config" "$HOME_DIR"
move_folder "$CURRENT_DIR/.themes" "$HOME_DIR"
move_folder "$CURRENT_DIR/menulib" "/usr/share"
move_folder "$CURRENT_DIR/themes" "/usr/share"

# fonts
echo "installing fonts..."
sudo pacman -S noto-fonts-emoji ttf-font-awesome ttf-symbola otf-openmoji ttf-mac-fonts --noconfirm

# emoji
echo "additional fonts are here:: https://wiki.archlinux.org/title/Fonts#Emoji_and_symbols"

# setting up obmenu-generator
echo "setting up obmenu-generator..."


obmenu-generator -S "$HOME_DIR/.config/openbox/obmenu-generator/schema.pl"
obmenu-generator -C "$HOME_DIR/.config/openbox/obmenu-generator/config.pl"
obmenu-generator -o "$HOME_DIR/.config/openbox/menu-icons.xml"

echo "done."

