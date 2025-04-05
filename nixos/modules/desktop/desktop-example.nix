# gnome-configuration.nix
# A comprehensive GNOME configuration module for NixOS
# Save this file and import it into your main configuration.nix with:
# imports = [ ./gnome-configuration.nix ];

{ config, pkgs, lib, ... }:

{
  # Define the user 'myuser'
  users.users.myuser = {
    isNormalUser = true;              # Declare as a normal user
    group = "myuser";                 # Assign to a custom group
    extraGroups = [ "wheel" "audio" ]; # Optional: Add to groups for sudo and sound
    home = "/home/myuser";            # Set home directory
    createHome = true;                # Automatically create home directory
    shell = pkgs.bash;                # Set default shell
  };

  # Define the group 'myuser'
  users.groups.myuser = {};

  # Enable the X server and GNOME desktop environment
  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      autoLogin = {
        enable = true;
        user = "myuser"; # Matches the defined user
      };
    };
    desktopManager.gnome.enable = true;
  };

  # Exclude unwanted GNOME default applications
  environment.gnome.excludePackages = (with pkgs; [
    atomix cheese epiphany evince geary gedit gnome-characters
    gnome-music gnome-photos gnome-terminal gnome-tour hitori iagno tali totem
  ]);

  # System-wide packages for GNOME functionality
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme            # Updated from gnome.adwaita-icon-theme
    gnomeExtensions.appindicator  # System tray support
    gnome-tweaks                  # Updated from gnome.gnome-tweaks
    sysprof                       # System profiling tool
  ];

  # Enable dconf for GNOME configuration management
  programs.dconf.enable = true;

  # Support for legacy GNOME 2 applications
  services.dbus.packages = with pkgs; [ gnome2.GConf ];

  # Enable udev rules for GNOME settings daemon (e.g., for tray icons)
  services.udev.packages = with pkgs; [ gnome-settings-daemon ]; # Updated from gnome.gnome-settings-daemon

  # Enable system profiling service
  services.sysprof.enable = true;

  # Enable automatic screen rotation for devices with sensors
  hardware.sensor.iio.enable = true;

  # Workaround for auto-login issues
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Overlay for dynamic triple buffering (GNOME 46 performance enhancement)
  nixpkgs.overlays = [
    (final: prev: {
      mutter = prev.mutter.overrideAttrs (old: {
        src = pkgs.fetchFromGitLab {
          domain = "gitlab.gnome.org";
          owner = "vanvugt";
          repo = "mutter";
          rev = "triple-buffering-v4-46";
          hash = "sha256-C2VfW3ThPEZ37YkX7ejlyumLnWa9oij333d5c4yfZxc=";
        };
      });
    })
  ];

  # Disable aliases to ensure overlay compatibility
  nixpkgs.config.allowAliases = false;

  # Home Manager configuration for user-specific GNOME settings
  home-manager.users.myuser = { pkgs, ... }: {
    # Enable dconf for user settings
    dconf = {
      enable = true;
      settings = {
        # Enable dark mode for GTK4 applications
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
        };
        # Configure GNOME Shell extensions
        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = with pkgs.gnomeExtensions; [
            blur-my-shell.extensionUuid  # Blur effect for shell
            gsconnect.extensionUuid      # KDE Connect integration
          ];
        };
        # Custom keybindings (example)
        "org/gnome/desktop/wm/keybindings" = {
          switch-applications = ["<Super>Tab"];
          close = ["<Alt>F4"];
        };
        # Wallpaper setting
        "org/gnome/desktop/background" = {
          picture-uri = "file:///home/myuser/wallpapers/custom-wallpaper.jpg";
          picture-uri-dark = "file:///home/myuser/wallpapers/custom-wallpaper-dark.jpg";
        };
      };
    };

    # Install additional user-specific packages
    home.packages = with pkgs; [
      firefox              # Preferred browser
      libreoffice          # Office suite
      vlc                  # Media player replacement for totem
    ];

    # Set GTK theme (example with Adwaita-dark)
    gtk = {
      enable = true;
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };
      iconTheme = {
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme; # Updated from gnome.adwaita-icon-theme
      };
    };
  };

  # Ensure Home Manager is enabled in the system
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  # Optional: Set a custom hostname for the system
  networking.hostName = "nixos-gnome-powerhouse";

  # Enable sound for a complete desktop experience
  sound.enable = true;
  hardware.pulseaudio.enable = true; # Or use pipewire instead

  # Set the system state version (adjust based on your NixOS version)
  system.stateVersion = "24.11"; # Example, update as needed
}
