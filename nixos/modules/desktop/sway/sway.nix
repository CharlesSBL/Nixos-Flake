{ pkgs, ... }:

{
  # Enable light for brightness control
  programs.light.enable = true;

  # Install essential packages for a functional Sway setup
  environment.systemPackages = with pkgs; [
    # alacritty   # Terminal emulator
    wofi # Application launcher
    grim # Screenshot tool
    slurp # Region selection for screenshots
    wl-clipboard # Clipboard management
    mako # Notification daemon
  ];
}
