{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # home-manager
    # core utils rewritten in rust
    # coreutils
    uutils-coreutils-noprefix # which ls to check if work
  ];

  nixpkgs.config.packageOverrides = pkgs: {
    coreutils = pkgs.uutils-coreutils-noprefix.override { prefix = ""; };
  };
}
