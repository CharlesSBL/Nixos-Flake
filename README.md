# Nixos Flake Project Overview
# Configuration with Home Manager

A NixOS configuration using flakes and Home Manager for system configuration and user environment management.

## Overview

This repository contains a complete NixOS configuration with:
- Modular system configuration
- Home Manager integration
- Desktop environments (GNOME and Hyprland)
- Development tools and applications
- System services and hardware configuration

## Structure

```
1-Nixos-Flake/
├── app-configurations        # local app configuration files
├── flake.nix                 # Main flake configuration
└── nixos/
    ├── configuration.nix     # Root configuration
    ├── hardware-configuration.nix
    └── modules/
        ├── apps/            # Application-specific configurations
        │   ├── android-cam.nix
        │   ├── bash-setup.nix
        │   ├── ollama-service.nix
        │   └── tor-conf.nix
        ├── desktop/         # Desktop environment configurations
        │   ├── gnome.nix
        │   └── hyprland.nix
        ├── system/         # Core system configurations
        │   ├── boot.nix
        │   ├── intel-drivers.nix
        │   ├── kernel-setup.nix
        │   ├── localization.nix
        │   ├── networking.nix
        │   ├── services.nix
        │   ├── system-packages.nix
        │   ├── users-conf.nix
        │   └── virtualization.nix
        ├── home-manager.nix  # Home Manager configuration
        ├── user-packages-dev.nix
        └── user-packages-other.nix
```

## Features

### Desktop Environments
- GNOME (primary)
- Hyprland (optional)

### Development Environment
- VSCode, Zed Editor, JetBrains IDEA
- Git and GitHub CLI
- Various language servers and development tools

### System Configuration
- Intel graphics drivers
- Virtualization support
- Network management
- Sound (PipeWire)
- Localization (US/PL)

### Applications
- Web browsers (Firefox, Google Chrome)
- Communication tools (Discord, Telegram)
- Media players (VLC)
- System utilities

## Usage

### Installation

1. Clone this repository:
```bash
git clone <repository-url> ~/1-Nixos-Flake
```

2. Switch to the configuration:
```bash
cd ~/1-Nixos-Flake
sudo nixos-rebuild switch --flake .#nixrach
```

### Custom Commands

The configuration includes several custom bash aliases:
- `nixb`: Rebuild NixOS configuration
- `nixg`: Update git repository
- `nixc`: Garbage collection
- `nixclean`: Clean and optimize Nix store
- `start-gui`/`stop-gui`: Control display manager
- `to-console`/`to-gui`: Switch between console and GUI

## Configuration

### User Configuration
The main user is configured as 'sach' with:
- NetworkManager access
- Wheel group membership
- Custom application set

### Home Manager
Includes configurations for:
- Git
- GNOME settings
- Custom keybindings
- Wallpaper settings

## System Requirements

- NixOS (tested on version 24.11)
- x86_64 architecture
- UEFI boot system

## Notes

- The configuration is primarily designed for development and desktop use
- Some features (like Hyprland and Tor) are included but disabled by default
- Custom keybindings are configured for GNOME
- Intel graphics drivers are included but must be enabled explicitly

## License

[License information here]
```

This README provides a comprehensive overview of your NixOS configuration, its structure, features, and usage instructions. You might want to customize it further based on specific details or requirements not apparent in the codebase.
