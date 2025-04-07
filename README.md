# Fedora Developer Workstation Setup

This repository provides a Bash script that automates the installation and configuration of a complete development environment on **Fedora Linux**. It is ideal for software engineers, system developers, and researchers who need a robust and reproducible setup.

---

## Features

The setup script performs the following actions:

### System Tools
- Updates all system packages using `dnf`
- Installs essential development tools: `vim`, `git`, `curl`, `wget`
- Installs `libfuse` for AppImage compatibility

### Python Development
- Installs Python 3.10
- Configures Python 3.10 as the default using the `alternatives` system
- Upgrades `pip` using `ensurepip`

### Rust Environment
- Installs Rust using the official `rustup` installer
- Loads Rust environment automatically

### Brave Browser
- Adds the official Brave repository
- Installs the Brave web browser

### JetBrains Toolbox
- Downloads and installs JetBrains Toolbox
- Adds a desktop entry for launching it from your application menu

### Obsidian (via Flatpak)
- Installs Flatpak and adds the Flathub repository
- Installs Obsidian note-taking app

### Shell Enhancements
- Installs Zsh
- Sets Zsh as the default login shell
- Installs [Oh My Zsh](https://ohmyz.sh/) for enhanced shell experience

---

## Usage

To set up your Fedora development environment:

### Step 1: Clone the Repository

```bash
git clone https://github.com/your-username/fedora-dev-setup.git
cd fedora-dev-setup
```

Replace `your-username` with your actual GitHub username.

### Step 2: Make the Script Executable

```bash
chmod +x setup.sh
```

### Step 3: Run the Script

```bash
./setup.sh
```

> Note: You will need to enter your sudo password when prompted.

---

## System Requirements

- Fedora Linux (Workstation or compatible)
- Sudo privileges
- Stable internet connection

---

## After Installation

- Restart your terminal or log out and log back in for shell changes to take effect.
- JetBrains Toolbox and Obsidian should now be available from your system’s application launcher.
., powerlevel10k)

---

## License

This project is licensed under the MIT License. See the LICENSE file for details.


