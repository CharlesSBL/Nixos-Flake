```nix

{ config, pkgs, ... }:

let
  # Pin an older Nixpkgs version with GNOME 43
  nixpkgs-gnome43 = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/refs/tags/22.11.tar.gz";
    sha256 = "1g3nx8lhawvprprzlill0jjkzvivr837l223jhr0kzhx8vflznhi"; # Verify this SHA
  }) { system = "x86_64-linux"; };
in
{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Override GNOME packages
  environment.systemPackages = with nixpkgs-gnome43; [
    gnome.gnome-shell
    gnome.gnome-control-center
    gnome.gnome-terminal
  ];

  # Use GNOME 43 explicitly
  services.xserver.desktopManager.gnome.package = nixpkgs-gnome43.gnome.gnome-shell;
}

```