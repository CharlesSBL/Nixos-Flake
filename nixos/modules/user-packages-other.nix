{ pkgs, ... }:

{
  users.users.sach.packages = with pkgs; [
    # openvpn  # Open source VPN client

    # Desktop Environment
    # waybar    # Highly customizable status bar for Wayland
    # hyprpaper # Wallpaper utility for Hyprland
    # networkmanagerapplet  # Network management tray applet

    # Development
    # dbeaver-bin          # Universal database tool
    # gitkraken           # Git client with GUI
    # insomnia            # REST API client
    # postgresql          # Open source database
    # gparted # not work correctly
    gnome-disk-utility # Disk management tool
    baobab # Disk usage analyzer

    # Containerization
    # podman              # Daemonless container engine
    # podman-desktop      # Desktop interface for Podman
    # docker             # Container platform
    # docker-compose     # Multi-container Docker applications

    # Virtualization
    gnome-boxes # Virtual machine manager

    # Graphics and Media
    # blender            # 3D creation suite
    # imagemagick        # Image manipulation tools
    vlc # Media player

    # Communication
    # slack              # Team collaboration platform
    discord # Voice and text chat
    telegram-desktop # Messaging app
    # thunderbird        # Email client

    # System Tools
    # cpu-x              # System information tool
    # htop               # Interactive process viewer
    # btop               # Resource monitor
    # tree               # Directory listing tool
    # fastfetch          # System information display
    # tmux               # Terminal multiplexer

    # Other Applications
    gnome-text-editor # Text editor
    gnome-calculator # Calculator
    papers # Document manager

    # resources          # System resource monitor
    easyeffects # Audio effects tool
    parsec-bin # Remote desktop software
    # bottles            # Windows compatibility layer
    # protonplus   # works only with steam
    # gfn-electron # nvidia now
    google-chrome # Web browser
    mediawriter # USB media creator
    foliate # E-book reader
    # flatpak            # Application deployment framework
    transmission_4-gtk # Torrent client
    nautilus # File manager
  ];
}
