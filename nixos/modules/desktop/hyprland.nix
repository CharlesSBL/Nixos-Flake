{ config, pkgs, ... }:

{
	# Hyprland desktop
	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};
}