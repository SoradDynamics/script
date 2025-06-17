#!/bin/bash

# Path to .bashrc
BASHRC="$HOME/.bashrc"

# Enable force color prompt
if ! grep -q "force_color_prompt=yes" "$BASHRC"; then
  echo "Enabling color prompt..."
  echo "force_color_prompt=yes" >> "$BASHRC"
else
  echo "Color prompt already enabled."
fi

# Add colorful PS1 if not already present
if ! grep -q "PS1='\\\[\\e" "$BASHRC"; then
  echo "Setting colorful and informative prompt..."
  cat << 'EOF' >> "$BASHRC"

# Custom colorful prompt
PS1='\[\e[1;32m\]\u@\h:\[\e[1;34m\]\w\[\e[0m\]\$ '
EOF
else
  echo "Custom prompt already set."
fi

# Apply the changes
echo "Applying changes..."
source "$BASHRC"

echo "✅ Done! Open a new terminal or run 'source ~/.bashrc' to see the colorful prompt."
