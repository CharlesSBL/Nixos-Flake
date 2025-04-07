{ pkgs, ... }:

{
  services.xserver.desktopManager.gnome.enable = false;

  services = {
				# System services
				dbus.packages = with pkgs; [ gnome2.GConf ];  # GConf configuration system
				udev.packages = with pkgs; [ gnome-settings-daemon ];  # GNOME settings daemon for hardware events
				sysprof.enable = true;  # System-wide Linux profiler
		};

		services.gnome = {
				core-utilities.enable = false;
				localsearch.enable = false;
				tinysparql.enable = false;
		};

		# Environment configuration
		environment = {
				systemPackages = with pkgs; [
						adwaita-icon-theme  # Default GNOME icon theme
						gnome-tweaks  # Advanced GNOME settings tool
						sysprof  # System-wide profiler for Linux
						gnome-extension-manager  # GUI tool for managing GNOME shell extensions
				];
		};

		# Program configurations
		programs.dconf.enable = true;

		# Hardware settings
		hardware.sensor.iio.enable = true;

		# System services configuration
		# systemd.services = {
		# 		"getty@tty1".enable = false;
		# 		"autovt@tty1".enable = false;
		# };
}
