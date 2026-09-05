set -euo pipefail

REPO="$HOME/Nix_Dot_Files"

SOURCE_NIX="/etc/nixos"
DEST_NIX="$REPO/etc/nixos"

CONFIG="$HOME/.config"
DEST_CONFIG="$REPO/.config"


cd "$REPO"

# ============================================================================
# NixOS configuration
# ============================================================================

rm -rf "$DEST_NIX"
mkdir -p "$(dirname "$DEST_NIX")"

cp -a "$SOURCE_NIX" "$DEST_NIX"

echo "NixOS configuration copied successfully."

# ============================================================================
# Selected user configuration
# ============================================================================

mkdir -p "$DEST_CONFIG"

for dir in lazygit nvim alacritty; do
    if [[ -d "$CONFIG/$dir" ]]; then
        rm -rf "$DEST_CONFIG/$dir"
        cp -a "$CONFIG/$dir" "$DEST_CONFIG/$dir"
        echo ".config/$dir copied successfully."
    fi
done

# ============================================================================
# Starship
# ============================================================================

if [[ -f "$CONFIG/starship.toml" ]]; then
    cp -a "$CONFIG/starship.toml" "$DEST_CONFIG/starship.toml"
    echo ".config/starship.toml copied successfully."
fi

# ============================================================================
# Zsh
# ============================================================================

if [[ -f "$HOME/.zshrc" ]]; then
    cp -a "$HOME/.zshrc" "$REPO/.zshrc"
    echo ".zshrc copied successfully."
fi

# ============================================================================
# Safety check (some lessons here were learned)
# ============================================================================

echo
echo "Checking for files that should never be committed..."

FORBIDDEN_FILES=$(find "$REPO" -type f \( \
    -name "key4.db" \
    -o -name "logins.json" \
    -o -name "cookies.sqlite" \
    -o -name "*.pem" \
    -o -name "*.key" \
    -o -name "*.p12" \
    -o -name "*.pfx" \
    -o -name "*.secret" \
    -o -name "*.secrets" \
    -o -name "*.token" \
    -o -name ".env" \
    \) -print)

if [[ -n "$FORBIDDEN_FILES" ]]; then
    echo
    echo "ERROR: Potentially sensitive files found:"
    echo "$FORBIDDEN_FILES"
    echo
    echo "Nothing will be committed or pushed."
    exit 1
fi

echo "Safety check passed."

# ============================================================================
# Git
# ============================================================================

echo
echo "Git status:"
git status

echo
echo "Files that will be committed:"
git add --dry-run .
git reset

echo
read -r -p "Continue with commit and push? [y/N] " answer

if [[ "$answer" != "y" && "$answer" != "Y" ]]; then
    echo "Aborted."
    exit 0
fi

git add .
git commit -m "Update NixOS and dotfiles configuration"
git push

echo
echo "Backup committed and pushed successfully."

