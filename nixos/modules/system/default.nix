{ ... }:

{
  imports = [
    ./boot.nix
    ./intel-drivers.nix
    ./intel.nix
    ./kernel-setup.nix
    ./localization.nix
    ./networking.nix
    ./services.nix
    ./system-packages.nix
    ./users-conf.nix
    ./virtualization.nix
  ];
}
