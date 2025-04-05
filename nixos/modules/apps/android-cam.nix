# scrcpy --list-cameras
# scrcpy
# adb devices

{ config, pkgs, ... }:

{
  # Enable ADB for Android device communication
  programs.adb.enable = true;

  # Add user 'sach' to the adbusers group for ADB access
  users.users.sach = {
    isNormalUser = true; # Ensure this user exists; adjust if already defined elsewhere
    extraGroups = [ "adbusers" "video" ]; # 'video' group for v4l2loopback access
  };

  # System-wide packages
  environment.systemPackages = with pkgs; [
    scrcpy              # For screen mirroring and control
    android-tools       # Includes adb; redundant if programs.adb.enable is true, but explicit
    droidcam            # DroidCam client for webcam functionality
    obs-studio          # OBS for recording/streaming
    (wrapOBS {          # OBS with DroidCam plugin
      plugins = with obs-studio-plugins; [ droidcam-obs ];
    })
  ];

  # Kernel and module configuration
  boot = {
    kernelModules = [ "v4l2loopback" ]; # Load v4l2loopback module
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ]; # Use kernel-specific version
    # extraModprobeConfig = ''
    #   options v4l2loopback devices=1 video_nr=2 card_label="VirtualCam" exclusive_caps=1
    # ''; # Define a single virtual camera device
  };
}
