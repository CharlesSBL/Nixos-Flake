{ config, pkgs, ... }:

{
		imports = [
				./gnome.nix
				./hyprland.nix
		];

		services.xserver = {
				enable = true;
				autorun = true;

				displayManager.gdm = {
						enable = true;

						# autoLogin = {
						#     enable = true;
						#     user = "myuser"; # Replace with your username
						# };
				};
				desktopManager.gnome.enable = false;
				xkb.options = "ctrl:swap_lalt_lctrl";
		};
}
