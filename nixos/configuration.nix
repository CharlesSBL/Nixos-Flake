# "configuration.nix"
# To rebuild the NixOS: "$ nixos-rebuild switch"
{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    # User apps
    ./modules/user-packages-dev.nix
    ./modules/user-packages-other.nix

    # System configurations
    ./modules/system

    # Application configurations
    ./modules/apps

    # Desktop configurations
    ./modules/desktop

    # Home Manager
    ./modules/home-manager.nix
  ];

  system.stateVersion = "24.11"; # Did you read the comment?
}
