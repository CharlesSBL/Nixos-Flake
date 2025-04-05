{ config, pkgs, ... }:

{
	# Gnome desktop
	services.xserver = {
		enable = true;
		displayManager.gdm = {
			enable = true;
			
			# autoLogin = {
			# 	enable = true;
			# 	user = "myuser"; # Replace with your username
			# };
		};
		desktopManager.gnome.enable = true;

		# Add xkbOptions to swap Left Alt and Left Ctrl
		xkb.options = "ctrl:swap_lalt_lctrl";
	};

	environment.gnome.excludePackages = (with pkgs; [
		# epiphany # web browser
		# evince # document viewer
		# gedit # text editor
		# gnome-photos
		# totem # video player
		atomix # puzzle game
		cheese # webcam tool
		geary # email reader
		gnome-characters
		gnome-music
		gnome-terminal
		gnome-tour
		hitori # sudoku game
		iagno # go game
		tali # poker game
	]);

	# System-wide packages for GNOME functionality
	environment.systemPackages = with pkgs; [
		adwaita-icon-theme      # Default GNOME icon theme
		gnome-tweaks            # GUI for additional GNOME settings
		sysprof                       # System profiling tool
		gnome-extension-manager
	];

	# Enable dconf for GNOME configuration management
	programs.dconf.enable = true;

	# Support for legacy GNOME 2 applications
	services.dbus.packages = with pkgs; [ gnome2.GConf ];

	# Enable udev rules for GNOME settings daemon (e.g., for tray icons)
	services.udev.packages = with pkgs; [ gnome-settings-daemon ];

	# Enable system profiling service
	services.sysprof.enable = true;

	# Enable automatic screen rotation for devices with sensors
	hardware.sensor.iio.enable = true;

	# Workaround for auto-login issues
	systemd.services."getty@tty1".enable = false;
	systemd.services."autovt@tty1".enable = false;

}
