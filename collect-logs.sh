#!/usr/bin/env bash
set -eu

mkdir -p logs
for name in $(nix flake show --json --legacy | jq '.legacyPackages."x86_64-linux" | to_entries[] | select (.value.type == "derivation") | .key' -r); do
    nix log ".#${name}" > "logs/${name}.log" || true
done
