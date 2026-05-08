#!/bin/bash

# Define the block of text to add
BLOCK_OF_STUFF=$(cat <<EOF

# my stuff
export EDITOR="vim"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
alias dev='cd ~/dev'
alias explorer='dolphin'
alias open='dolphin'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gd='git diff'
alias gp='git pull --prune'
alias gs='git status'
# end my stuff
EOF
)

# Check if the marker "# my stuff" already exists in .bashrc
if ! grep -q "# my stuff" ~/.bashrc; then
    echo "$BLOCK_OF_STUFF" >> ~/.bashrc
    echo "Configuration added to .bashrc"
else
    echo "Configuration already exists, skipping."
fi
