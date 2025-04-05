# Android Device Management Commands
# scrcpy --list-cameras
# scrcpy
# adb devices

{ config, pkgs, ... }: {
  # Android Debug Bridge Configuration
  programs.adb = {
    enable = true;
  };

  # User Configuration
  users.users.sach = {
    isNormalUser = true;
    extraGroups = [
      "adbusers"
      "video"
    ];
  };

  # Package Management
  environment.systemPackages = with pkgs; [
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

  # Kernel Configuration
  boot = {
    kernelModules = [
      "v4l2loopback"
    ];
    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
    ];
    # extraModprobeConfig = ''
    #   options v4l2loopback devices=1 video_nr=2 card_label="VirtualCam" exclusive_caps=1
    # '';
  };
}
