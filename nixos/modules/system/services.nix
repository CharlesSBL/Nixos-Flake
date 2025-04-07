{ config, pkgs, ... }:

{
  # Printing service
  services.printing = {
    enable = true;
  };


services.pulseaudio.enable = false;
services.pipewire.enable = true;
services.pipewire.alsa.enable = true;
services.pipewire.alsa.support32Bit = true;
services.pipewire.pulse.enable = true;
services.pipewire.extraConfig.pipewire."99-high-buffer" = {
  "context.properties" = {
    "default.clock.rate" = 48000;  # Common sample rate, adjust if needed
    "default.clock.quantum" = 1024; # Increase from default (e.g., 32 or 64)
    "default.clock.min-quantum" = 1024;
    "default.clock.max-quantum" = 1024;
  };
};

  # sound.enable = true;
  # services.pipewire.enable = false;
  # hardware.pulseaudio.enable = true;
  # hardware.pulseaudio.support32Bit = true;
  # nixpkgs.config.pulseaudio = true;
  # hardware.pulseaudio.extraConfig = "load-module module-combine-sink";


  # Security settings
  security = {
    rtkit.enable = true;
  };
}
