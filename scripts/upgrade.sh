#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
host="${1:-}"

case "$host" in
  desktop|laptop|generic) ;;
  *)
    printf 'Usage: %s {desktop|laptop|generic}\n' "$0" >&2
    exit 2
    ;;
esac

cd "$repo_root"

nix flake update
nh os switch "$repo_root" --hostname "$host"
