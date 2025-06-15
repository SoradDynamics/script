#!/bin/bash

BASHRC="$HOME/.bashrc"

# Ensure backup
cp "$BASHRC" "$BASHRC.bak"

# Set force_color_prompt
if grep -q "^# *force_color_prompt=yes" "$BASHRC"; then
    sed -i 's/^# *force_color_prompt=yes/force_color_prompt=yes/' "$BASHRC"
elif ! grep -q "^force_color_prompt=yes" "$BASHRC"; then
    echo "force_color_prompt=yes" >> "$BASHRC"
fi

# Set colorful PS1
if ! grep -q "PS1='\\\[\\e\[1;32m\\\]\\u@\\h:\\w\\\$\\\[\\e\[0m\\\] '" "$BASHRC"; then
    echo "PS1='\\\[\\e[1;32m\\\]\\u@\\h:\\w\\\$\\\[\\e[0m\\\] '" >> "$BASHRC"
fi

# Apply changes
source "$BASHRC"

echo -e "\e[1;32m✔ Color prompt enabled. Your shell should now be colorful.\e[0m"
