#!/bin/bash


# Fedora Workstation Automation Setup
# Author: Joav YO
# This script sets up a complete developer environment on Fedora Linux

set -e  # Exit immediately if a command exits with a non-zero status

PYTHON_VERSION=3.10  # Define Python version

# Update system packages
sudo dnf update -y

# Install Zsh, Oh My Zsh, Vim, and Git
sudo dnf install -y vim git curl wget

# Install libfuse
sudo dnf install fuse fuse-libs

# Install Python and set as default
sudo dnf install -y python${PYTHON_VERSION}
sudo alternatives --install /usr/bin/python python /usr/bin/python${PYTHON_VERSION} 1
sudo alternatives --config python

# Upgrade Pip
python -m ensurepip --upgrade
python -m pip install --upgrade pip

# Install Rust via rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

# Install Brave Browser
curl -fsS https://dl.brave.com/install.sh | sh

# Install JetBrains Toolbox
wget -O jetbrains-toolbox.tar.gz "https://data.services.jetbrains.com/products/download?code=TB&platform=linux"
tar -xzf jetbrains-toolbox.tar.gz
mv jetbrains-toolbox-* jetbrains-toolbox
sudo mv jetbrains-toolbox /opt/
sudo ln -s /opt/jetbrains-toolbox/jetbrains-toolbox /usr/local/bin/jetbrains-toolbox

# Create JetBrains Toolbox desktop entry
cat <<EOF | sudo tee /usr/share/applications/jetbrains-toolbox.desktop
[Desktop Entry]
Name=JetBrains Toolbox
Exec=/opt/jetbrains-toolbox/jetbrains-toolbox
Icon=/opt/jetbrains-toolbox/.install4j/jetbrains-toolbox.png
Terminal=false
Type=Application
Categories=Development;
EOF

# Install Obsidian via Flatpak
sudo dnf install -y flatpak
dnf install -y dnf-plugins-core
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub md.obsidian.Obsidian

# Install zsh
sudo dnf install zsh 

# Change default shell to Zsh
chsh -s $(which zsh)

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Completion Message
echo "\nSetup complete! Please restart your terminal or log out and log back in for changes to take effect."
