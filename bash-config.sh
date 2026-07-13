#!/bin/bash

TARGET_FILE="$HOME/.bashrc"

# 1. Define the exports
EXPORT_BLOCK=$(cat <<EOF

# global exports
export EDITOR="vim"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
# end global exports
EOF
)

# 2. Define the aliases
ALIAS_BLOCK=$(cat <<EOF

# my aliases
alias dev='cd ~/dev'
alias explorer='dolphin'
alias open='dolphin'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gd='git diff'
alias gp='git pull --prune'
alias gs='git status'
alias gpsmu='git submodule update --init --recursive'
# end my aliases
EOF
)

# --- Handle Exports (Insert after the 3rd line of the header) ---
if ! grep -q "# global exports" "$TARGET_FILE"; then
    awk -v v="$EXPORT_BLOCK" '
        /# ~\/\.bashrc/ {
            print $0;
            getline;
            print $0;
            print v;
            next
        }
        { print }
    ' "$TARGET_FILE" > "$TARGET_FILE.tmp" && mv "$TARGET_FILE.tmp" "$TARGET_FILE"

    echo "Exports added after header block."
else
    echo "Exports already exist, skipping."
fi

# --- Handle Aliases (Append to bottom) ---
if ! grep -q "# my aliases" "$TARGET_FILE"; then
    echo "$ALIAS_BLOCK" >> "$TARGET_FILE"
    echo "Aliases added to bottom of .bashrc."
else
    echo "Aliases already exist, skipping."
fi
