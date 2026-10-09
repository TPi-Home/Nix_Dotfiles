#!/usr/bin/env bash

set -e

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"

nix flake update nixpkgs
sudo nixos-rebuild switch --flake "${repo_root}#generic"
