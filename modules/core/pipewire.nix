{ pkgs, pkgs2411, config, ... }: # Add pkgs2411 to module arguments
{
  services.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    # package = pkgs2411.pipewire; # Use PipeWire from 24.11
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # pulse.package is not needed; pulse.enable uses the main package
    # lowLatency.enable = true; # Uncomment if needed
  };

  hardware.alsa.enablePersistence = true;
  environment.systemPackages = with pkgs; [ pulseaudioFull ];

  services.pipewire.extraConfig.pipewire."99-high-buffer" = {
    "context.properties" = {
      "default.clock.rate" = 48000;
      "default.clock.quantum" = 1024;
      "default.clock.min-quantum" = 1024;
      "default.clock.max-quantum" = 1024;
    };
  };
}
