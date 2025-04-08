{ ... }:

{
  imports = [
    ./conf.nix
    ./gnome.nix
  ];

  services.xserver.desktopManager.gnome.enable = true;
}
