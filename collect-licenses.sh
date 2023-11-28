#!/usr/bin/env bash
set -eu

MYDIR=$(dirname "$(readlink -f "$0")")
TMPDIR=$(mktemp -d)
trap 'rm -rf $TMPDIR' EXIT

echo "# Prebuilding sources..."
nix build "$MYDIR#all.sources" --no-link || true

echo "# Evaluating sources..."
declare -A sources
eval "$(nix eval "$MYDIR#sources" --json | jq 'to_entries[] | "sources[" + .key + "]=" + .value' -r)"

echo "# Collecting licenses..."
for k in "${!sources[@]}"; do
    echo "- Processing $k..."

    mkdir "$TMPDIR/$k"
    tar -C "$TMPDIR/$k" -xf "${sources[$k]}"

    (cd "$TMPDIR/$k"; reuse lint --json) | jq --arg name "$k" '{$name: .summary.used_licenses | sort}' -c > "$TMPDIR/$k.json"
done

jq -s 'add' -S "$TMPDIR"/*.json > "$MYDIR/pkgs/kde/generated/licenses.json"
