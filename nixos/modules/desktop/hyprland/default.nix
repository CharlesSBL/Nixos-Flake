{ inputs, ... }:
{
  imports = [
    ./hyprland.nix
    ./config.nix
    ./hyprlock.nix
    ./variables.nix
    ./hypr-apps.nix
    inputs.hyprland.homeManagerModules.default
  ];
}
