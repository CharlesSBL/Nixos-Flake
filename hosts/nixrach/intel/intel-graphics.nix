{ pkgs, ... }:
{
  hardware.opengl = {
    enable = true;
    # driSupport and driSupport32Bit are enabled by default, so no need to specify
    extraPackages = with pkgs; [
      intel-media-driver # VAAPI for Intel iGPUs (Tiger Lake)
      # vaapiIntel # Legacy VAAPI support
      libvdpau-va-gl # VDPAU compatibility for Parsec
      intel-compute-runtime # Optional: OpenCL support
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [
      libvdpau-va-gl # 32-bit VDPAU for compatibility
      # vaapiIntel # 32-bit VAAPI
    ];
  };

  services.xserver = {
    videoDrivers = [ "intel" ]; # Use Intel driver
  };

  # Optional: Ensure X11 permissions
  services.xserver.exportConfiguration = true;
}
