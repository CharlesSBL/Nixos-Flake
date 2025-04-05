# PATH: "/etc/nixos/modules/user-packages-other.nix"
{ config, pkgs, ... }:

{
  users.users.sach.packages = with pkgs; [
    imagemagick 
	# imagemagick is to convert jpg to webp, 
	# commands below:
	#   $ mogrify -format webp *.jpg 
	#   $ mogrify -quality 75 *.webp
    waybar
    hyprpaper
    networkmanagerapplet

    # System and network tools
    gitkraken
    insomnia
    htop
    btop
    tree
    fastfetch
    tmux
    postgresql
    podman
    docker
    docker-compose
    # Productivity and communication tools
    discord
    gfn-electron
    telegram-desktop
    thunderbird
    # gnome-extension-manager
    # Virtualization and emulation tools
    gnome-boxes
    parsec-bin
    # Web browsers
    google-chrome
    # Media and writing tools
    mediawriter
    foliate
    # gnome-tweaks
    # Database tools
    dbeaver-bin
    # Package managers
    flatpak
    # Torrent clients
    transmission_4-gtk
  ];
}
