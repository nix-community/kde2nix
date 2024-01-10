#!/usr/bin/env bash
set -eu
cd "$(dirname "$(readlink -f "$0")")"/../../..

mkdir -p logs
for name in $(nix-env -qaP -f . -A kdePackages --json | jq -r 'to_entries[] | .key'); do
    nix-store --read-log "$(nix-instantiate --eval . -A  "${name}.outPath" --json | jq -r)" > "logs/${name}.log" || true
done
