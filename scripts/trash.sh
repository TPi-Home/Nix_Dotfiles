sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations +5
sudo nix-collect-garbage
echo "Run nix-collect-garbage -d to remove older generations of user profiles before running the cleanup."
