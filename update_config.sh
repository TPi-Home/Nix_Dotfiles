set -e

REPO="$HOME/Nix_Dot_Files"

# NixOS configuration
SOURCE_NIX="/etc/nixos"
DEST_NIX="$REPO/etc/nixos"

# User configuration
CONFIG="$HOME/.config"

cd "$REPO" || exit 1

# Back up /etc/nixos
rm -rf "$DEST_NIX"
mkdir -p "$(dirname "$DEST_NIX")"
cp -a "$SOURCE_NIX" "$DEST_NIX"
echo "NixOS configuration copied successfully."

# Back up selected .config directories
mkdir -p "$REPO/.config"

for dir in lazygit nvim alacritty; do
    rm -rf "$REPO/.config/$dir"
    cp -a "$CONFIG/$dir" "$REPO/.config/$dir"
    echo ".config/$dir copied successfully."
done

# Back up .zshrc
cp -a "$HOME/.zshrc" "$REPO/.zshrc"
echo ".zshrc copied successfully."

# Git
echo
echo "Git status:"
git status

git add .
git commit -m "Update NixOS and dotfiles configuration"
git push

echo
echo "Backup committed and pushed successfully."

