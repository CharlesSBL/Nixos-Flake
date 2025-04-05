# PATH: "/etc/nixos/configuration.nix"
# To rebuild the NixOS: "$ nixos-rebuild switch"
{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz";
in
{
  imports = [
    # Hardware configuration
    ./hardware-configuration.nix

    # user apps
    ./modules/user-packages-dev.nix
    ./modules/user-packages-other.nix
    
    # system configurations
    ./modules/system/boot.nix
    ./modules/system/networking.nix
    ./modules/system/localization.nix
    ./modules/system/services.nix
    ./modules/system/virtualization.nix
    ./modules/system/system-packages.nix
    ./modules/system/users-conf.nix
    ./modules/system/intel-drivers.nix
    ./modules/system/kernel-setup.nix

    # application configurations
    ./modules/apps/ollama-service.nix
    ./modules/apps/bash-setup.nix
    ./modules/apps/tor-conf.nix
    ./modules/apps/android-cam.nix

    
    # desktop configuration
    ./modules/desktop/gnome.nix
    ./modules/desktop/hyprland.nix

    ./modules/home-manager.nix
    # Import the home-manager module itself
    # "${home-manager}/nixos"
  ];

  system.stateVersion = "24.11"; # Did you read the comment?
}
