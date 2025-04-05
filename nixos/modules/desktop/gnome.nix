{ config, pkgs, ... }:

{
				# Gnome desktop configuration
				services = {
								xserver = {
												enable = true;
												displayManager.gdm = {
																enable = true;

																# autoLogin = {
																#     enable = true;
																#     user = "myuser"; # Replace with your username
																# };
												};
												desktopManager.gnome.enable = true;
												xkb.options = "ctrl:swap_lalt_lctrl";
								};

								# System services
								dbus.packages = with pkgs; [ gnome2.GConf ];
								udev.packages = with pkgs; [ gnome-settings-daemon ];
								sysprof.enable = true;
				};

				services.gnome.core-utilities.enable = false;

				# Environment configuration
				environment = {
								gnome.excludePackages = (with pkgs; [
												atomix
												cheese
												geary
												gnome-characters
												gnome-music
												gnome-terminal
												gnome-tour
												hitori
												iagno
												tali
								]);

								systemPackages = with pkgs; [
												adwaita-icon-theme
												gnome-tweaks
												sysprof
												gnome-extension-manager
								];
				};

				# Program configurations
				programs.dconf.enable = true;

				# Hardware settings
				hardware.sensor.iio.enable = true;

				# System services configuration
				systemd.services = {
								"getty@tty1".enable = false;
								"autovt@tty1".enable = false;
				};

				services.gnome.localsearch.enable = false;
  			services.gnome.tinysparql.enable = false;
}
