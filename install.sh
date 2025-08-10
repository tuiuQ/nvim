#!/bin/bash

# Define colors for output
GREEN='[0;32m'
RED='[0;31m'
YELLOW='[1;33m'
NC='[0m' # No Color

# --- Configuration ---
# List of dependencies to check.
# The format is "command:package". If package is the same as command, just use "command".
# Example: "fdfind:fd-find"
dependencies=(
    "xclip"
    "xsel"
    "git"
    "curl"
    "unzip"
    "lazygit"
    "nvim"
)

# --- Script Logic ---
echo -e "${YELLOW}Checking for required dependencies...${NC}"

missing_deps=()
for dep in "${dependencies[@]}"; do
    # Split command and package name if format "command:package" is used
    IFS=':' read -r cmd package <<< "$dep"
    if [ -z "$package" ]; then
        package="$cmd"
    fi

    if command -v "$cmd" &> /dev/null; then
        echo -e "✅ ${GREEN}Found:${NC} $cmd"
    else
        echo -e "❌ ${RED}Missing:${NC} $cmd (package: $package)"
        missing_deps+=("$package")
    fi
done

if [ ${#missing_deps[@]} -eq 0 ]; then
    echo -e "\n${GREEN}👍 All dependencies are installed. You're good to go!${NC}"
    exit 0
fi

echo -e "\n${YELLOW}The following dependencies are missing:${NC}"
for pkg in "${missing_deps[@]}"; do
    echo "  - $pkg"
done

# Check if the OS is Ubuntu and offer to install
if [ -f /etc/os-release ] && grep -q "ID=ubuntu" /etc/os-release; then
    echo
    read -p "This looks like an Ubuntu system. Do you want to try and install the missing packages? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${YELLOW}Attempting to install missing packages...${NC}"
        sudo apt-get update
        sudo apt-get install -y "${missing_deps[@]}"
        echo -e "\n${GREEN}Installation attempt finished. Please re-run this script to verify.${NC}"
    else
        echo -e "${YELLOW}Installation skipped. Please install the dependencies manually.${NC}"
    fi
else
    echo -e "\n${YELLOW}Please install the missing dependencies using your system's package manager.${NC}"
fi

exit 1
