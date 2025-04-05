{ config, pkgs, ... }:

{
	users.users.sach.packages = with pkgs; [
		# Desktop Environment
		waybar
		hyprpaper
		networkmanagerapplet

		# Development
		dbeaver-bin
		gitkraken
		insomnia
		postgresql
		gparted
		gnome-disk-utility
		baobab

		# Containerization
		podman
		podman-desktop
		docker
		docker-compose

		# Virtualization
		gnome-boxes

		# Graphics and Media
		blender
		imagemagick
		vlc

		# Communication
		slack
		discord
		telegram-desktop
		thunderbird

		# System Tools
		cpu-x
		htop
		btop
		tree
		fastfetch
		tmux

		# Other Applications
		gnome-text-editor
		resources
		easyeffects
		parsec-bin
		bottles
		protonplus
		gfn-electron
		google-chrome
		mediawriter
		foliate
		flatpak
		transmission_4-gtk
		nautilus
	];
}
