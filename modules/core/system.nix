{ self
, pkgs
, lib
, inputs
, ...
}:
{
  # imports = [ inputs.nix-gaming.nixosModules.default ];
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://nix-gaming.cachix.org"
        "https://hyprland.cachix.org"
        "https://ghostty.cachix.org"
      ];
      trusted-public-keys = [
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="
      ];
    };
  };
  nixpkgs = {
    overlays = [ inputs.nur.overlays.default ];
  };

  environment.systemPackages = with pkgs; [
    wget
    git
    coreutils
    uutils-coreutils-noprefix # which ls to check if work

    # Device Control
    scrcpy
    android-tools

    # Camera and Streaming
    droidcam
    obs-studio
    (wrapOBS {
      plugins = with obs-studio-plugins; [
        droidcam-obs
      ];
    })
  ];

  nixpkgs.config.packageOverrides = pkgs: {
    coreutils = pkgs.uutils-coreutils-noprefix.override { prefix = ""; };
  };

  # Android Debug Bridge Configuration
  programs.adb = {
    enable = true;
  };

  # Program configurations
  programs.dconf.enable = true;

  # Hardware settings
  hardware.sensor.iio.enable = true;

  home-manager.backupFileExtension = "backup";

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05";
}
