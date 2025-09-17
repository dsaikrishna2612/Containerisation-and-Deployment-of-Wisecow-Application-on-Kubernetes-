#!/bin/bash
set -e

# Ensure cowsay, fortune, and netcat are available
command -v cowsay >/dev/null || { echo "❌ cowsay not found"; exit 1; }
command -v fortune >/dev/null || { echo "❌ fortune not found"; exit 1; }
command -v nc >/dev/null || { echo "❌ netcat not found"; exit 1; }

# Add cowsay to PATH if needed
export PATH="/usr/games:$PATH"

# Start the server
exec /opt/wisecow/wisecow.sh
