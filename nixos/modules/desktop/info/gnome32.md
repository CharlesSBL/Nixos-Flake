## with configuration.nix

# for   "gnome-shell" version = "46.2" use release 24.05 of nixpkgs

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

## With flake.nix

```nix

{
  description = "NixOS configuration with GNOME 43";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05"; # Your current version
    nixpkgs-gnome43.url = "github:NixOS/nixpkgs/nixos-22.11"; # For GNOME 43
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, nixpkgs-gnome43, flake-utils }:
    {
      nixosConfigurations.mySystem = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ({ config, pkgs, ... }:
          let
            # Use the older nixpkgs for GNOME packages
            gnome43Pkgs = import nixpkgs-gnome43 {
              system = "x86_64-linux";
              config.allowUnfree = true; # Adjust as needed
            };
          in
          {
            # Enable GNOME desktop environment with version 43
            services.xserver.enable = true;
            services.xserver.displayManager.gdm.enable = true;
            services.xserver.desktopManager.gnome.enable = true;

            # Override GNOME packages to use version 43
            environment.systemPackages = with gnome43Pkgs; [
              gnome.gnome-shell
              gnome.gnome-control-center
              gnome.gnome-terminal
              # Add other GNOME packages you need
            ];

            # Ensure the gnome session uses the older version
            services.xserver.desktopManager.gnome.package = gnome43Pkgs.gnome.gnome-shell;
          })
        ];
      };
    };
}

```