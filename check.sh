echo "Installed/pinned:"
nix flake metadata --json | jq -r '.locks.nodes.nixpkgs.locked.rev'

echo "Latest channel:"
nix flake metadata --json github:NixOS/nixpkgs/nixos-unstable |
  jq -r '.revision'
