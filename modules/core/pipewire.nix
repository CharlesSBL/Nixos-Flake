{ pkgs, config, ... }:
let
  pkgs2411 = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/24.11.tar.gz") {
    config = config.nixpkgs.config;
  };
in
{
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    package = pkgs2411.pipewire;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    pulse.package = pkgs2411.pipewire-pulse;
    # lowLatency.enable = true;
  };
  hardware.alsa.enablePersistence = true;
  environment.systemPackages = with pkgs; [ pulseaudioFull ];

  services.pipewire.extraConfig.pipewire."99-high-buffer" = {
    "context.properties" = {
      "default.clock.rate" = 48000; # Common sample rate, adjust if needed
      "default.clock.quantum" = 1024; # Increase from default (e.g., 32 or 64)
      "default.clock.min-quantum" = 1024;
      "default.clock.max-quantum" = 1024;
    };
  };
}
