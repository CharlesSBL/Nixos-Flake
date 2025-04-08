{ ... }:

{
  imports = [
    ./gnome
    ./sway
    ./hyprland
  ];

  services.xserver.enable = true;
  services.xserver.autorun = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.xkb.options = "ctrl:swap_lalt_lctrl";
}
