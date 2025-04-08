{ ... }:
{
  imports = [
    ./conf.nix
    ./sway.nix
  ];

  # Enable Sway Wayland compositor
  programs.sway.enable = true;
}
