{ ... }: {
  # Configure Home Manager for the user
  # Replace 'yourusername' with your actual username
  home-manager.users.sach = { ... }: {
    wayland.windowManager.sway = {
      enable = true;
      wrapperFeatures.gtk = true; # so that GTK applications work properly
      config = rec {
        modifier = "Mod4"; # Use the Windows key as modifier
        terminal = "ghostty";
        menu = "wofi --show run";
        startup = [
          { command = "mako"; } # Start notification daemon
        ];
        keybindings =
          let
            mod = modifier; # Alias for cleaner syntax
          in
          {
            # Basic window management
            "${mod}+Return" = "exec ${terminal}";
            "${mod}+Shift+q" = "kill";
            "${mod}+d" = "exec ${menu}";

            # Fullscreen toggle
            "${mod}+f" = "fullscreen toggle";

            # Focus navigation
            "${mod}+Left" = "focus left";
            "${mod}+Down" = "focus down";
            "${mod}+Up" = "focus up";
            "${mod}+Right" = "focus right";

            # Move focused window
            "${mod}+Shift+Left" = "move left";
            "${mod}+Shift+Down" = "move down";
            "${mod}+Shift+Up" = "move up";
            "${mod}+Shift+Right" = "move right";

            # Workspace switching (1 to 10)
            "${mod}+1" = "workspace number 1";
            "${mod}+2" = "workspace number 2";
            "${mod}+3" = "workspace number 3";
            "${mod}+4" = "workspace number 4";
            "${mod}+5" = "workspace number 5";
            "${mod}+6" = "workspace number 6";
            "${mod}+7" = "workspace number 7";
            "${mod}+8" = "workspace number 8";
            "${mod}+9" = "workspace number 9";
            "${mod}+0" = "workspace number 10";

            # Move focused container to workspace
            "${mod}+Shift+1" = "move container to workspace number 1";
            "${mod}+Shift+2" = "move container to workspace number 2";
            "${mod}+Shift+3" = "move container to workspace number 3";
            "${mod}+Shift+4" = "move container to workspace number 4";
            "${mod}+Shift+5" = "move container to workspace number 5";
            "${mod}+Shift+6" = "move container to workspace number 6";
            "${mod}+Shift+7" = "move container to workspace number 7";
            "${mod}+Shift+8" = "move container to workspace number 8";
            "${mod}+Shift+9" = "move container to workspace number 9";
            "${mod}+Shift+0" = "move container to workspace number 10";

            # Layout toggles
            "${mod}+s" = "layout stacking";
            "${mod}+w" = "layout tabbed";
            "${mod}+e" = "layout toggle split";

            # Toggle floating/tiling
            "${mod}+Shift+space" = "floating toggle";
            "${mod}+space" = "focus mode_toggle"; # Switch between tiling/floating focus

            # Resize mode
            "${mod}+r" = "mode \"resize\"";

            # Reload and exit
            "${mod}+Shift+c" = "reload";
            "${mod}+Shift+e" = "exec swaymsg exit"; # Direct exit with Super+Shift+e

            # Brightness and volume controls
            "XF86MonBrightnessUp" = "exec light -A 10";
            "XF86MonBrightnessDown" = "exec light -U 10";
            "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
            "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
            "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
          };

        # Define resize mode
        modes = {
          resize = {
            "Left" = "resize shrink width 10 px or 10 ppt";
            "Down" = "resize grow height 10 px or 10 ppt";
            "Up" = "resize shrink height 10 px or 10 ppt";
            "Right" = "resize grow width 10 px or 10 ppt";
            "Return" = "mode \"default\"";
            "Escape" = "mode \"default\"";
          };
        };
      };
    };
  };
}
