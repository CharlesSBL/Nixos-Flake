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
		# gparted # not work correctly
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
		gnome-calculator
		papers
		
		resources
		easyeffects
		parsec-bin
		bottles
		# protonplus   # works only with steam
		# gfn-electron # nvidia now
		google-chrome
		mediawriter
		foliate
		flatpak
		transmission_4-gtk
		nautilus
	];
}
