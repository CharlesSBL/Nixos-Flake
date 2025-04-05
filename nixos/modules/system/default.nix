{ config, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./intel-drivers.nix
    ./kernel-setup.nix
    ./localization.nix
    ./networking.nix
    ./services.nix
    ./system-packages.nix
    ./users-conf.nix
    ./virtualization.nix
  ];
}
