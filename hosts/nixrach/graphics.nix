{...}:{
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true; # If running 32-bit apps
    extraPackages = with pkgs; [
      libvdpau
      vaapiVdpau
      libvdpau-va-gl # This provides libvdpau_va_gl.so
    ];
  };

  # NVIDIA-specific settings
  hardware.nvidia = {
    modesetting.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Ensure X11 is configured
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
  };
}
