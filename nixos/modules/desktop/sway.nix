{ config, pkgs, ... }:

{
  # Enable Sway Wayland compositor
  programs.sway.enable = true;

  # Enable XServer and GDM for graphical login
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  # Enable light for brightness control
  programs.light.enable = true;

  # Install essential packages for a functional Sway setup
  environment.systemPackages = with pkgs; [
    # alacritty   # Terminal emulator
    wofi        # Application launcher
    grim        # Screenshot tool
    slurp       # Region selection for screenshots
    wl-clipboard # Clipboard management
    mako        # Notification daemon
  ];

  # Configure Home Manager for the user
  # Replace 'yourusername' with your actual username
  home-manager.users.sach = { pkgs, ... }: {
    wayland.windowManager.sway = {
      enable = true;
      wrapperFeatures.gtk = true; # so that GTK applications work properly
      config = rec {
        modifier = "Mod4";  # Use the Windows key as modifier
        terminal = "ghostty";
        menu = "wofi --show run";
        startup = [
          { command = "mako"; }  # Start notification daemon
        ];
        bindsym = {
          "${modifier}+Return" = "exec ${terminal}";
          "${modifier}+Shift+q" = "kill";
          "${modifier}+d" = "exec ${menu}";
          "XF86MonBrightnessUp" = "exec light -A 10";
          "XF86MonBrightnessDown" = "exec light -U 10";
          "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
          "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
          "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
        };
      };
    };
  };
}
