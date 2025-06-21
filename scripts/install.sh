#!/bin/bash

set -e

# Check that lutris is installed
if ! command -v lutris &> /dev/null; then
    echo "Lutris is not installed. Please install Lutris first."
    exit 1
fi

URL="https://mangelmaxime.github.io/guild-wars-enhanced-lutris/scripts/guild-wars-enhanced.yml"

DOWNLOAD_DIR=$(mktemp -d)

echo "Downloading Guild Wars Enhanced script..."

if ! curl -fsSL "$URL" -o "$DOWNLOAD_DIR/guild-wars-enhanced.yml"; then
    echo "Failed to download the script."
    exit 1
fi

echo "Installing Guild Wars Enhanced using Lutris..."

# I don't know how to wait for Lutris to finish installing
# so we can't check if the installation was successful
lutris -i "$DOWNLOAD_DIR/guild-wars-enhanced.yml"
