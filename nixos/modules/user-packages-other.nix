# PATH: "/etc/nixos/modules/user-packages-other.nix"
{ config, pkgs, ... }:

{
		users.users.sach.packages = with pkgs; [
				# Desktop environment
				waybar
				hyprpaper
				networkmanagerapplet

				# Image tools
				imagemagick  # For converting jpg to webp:
																	# $ mogrify -format webp *.jpg
																	# $ mogrify -quality 75 *.webp

				# System and network tools
				gitkraken
				insomnia
				htop
				btop
				tree
				fastfetch
				tmux

				# Containers and virtualization
				postgresql
				podman
				docker
				docker-compose
				gnome-boxes
				parsec-bin

				# Productivity and communication
				discord
				gfn-electron
				telegram-desktop
				thunderbird
				# gnome-extension-manager

				# Web browsers
				google-chrome

				# Media and documents
				mediawriter
				foliate
				# gnome-tweaks

				# Development tools
				dbeaver-bin

				# Package management
				flatpak

				# Downloads
				transmission_4-gtk
		];
}
