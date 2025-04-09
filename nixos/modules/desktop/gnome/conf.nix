{ pkgs, ... }:

{
  home-manager.users.sach =
    { pkgs, ... }:
    {
      # Manually set GTK icon theme via config file
      xdg.configFile."gtk-3.0/settings.ini".text = ''
        [Settings]
        gtk-icon-theme-name=WhiteSur
      '';

      # Dconf settings for GNOME
      dconf.settings = {
        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = with pkgs.gnomeExtensions; [
            blur-my-shell.extensionUuid
            tiling-shell.extensionUuid
            disable-workspace-animation.extensionUuid
            grayscale-windows.extensionUuid
          ];
        };

        "org/gnome/desktop/wm/keybindings" = {
          # Application controls
          switch-applications = [ "<Ctrl>Tab" ];
          close = [ "<Ctrl><Shift>W" ];

          # Window management
          maximize = [ "<Super>F" ];
          begin-move = [ "<Super>M" ];
          unmaximize = [ "<Super>D" ];

          # Workspace switching
          switch-to-workspace-1 = [ "<Ctrl>1" ];
          switch-to-workspace-2 = [ "<Ctrl>2" ];
          switch-to-workspace-3 = [ "<Ctrl>3" ];
          switch-to-workspace-4 = [ "<Ctrl>4" ];
          switch-to-workspace-left = [ "<Super><Shift>Left" ];
          switch-to-workspace-right = [ "<Super><Shift>Right" ];

          # Window workspace movement
          move-to-workspace-1 = [ "<Ctrl><Shift>1" ];
          move-to-workspace-2 = [ "<Ctrl><Shift>2" ];
          move-to-workspace-3 = [ "<Ctrl><Shift>3" ];
          move-to-workspace-4 = [ "<Ctrl><Shift>4" ];
        };

        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
          name = "Launch Ghostty";
          command = "ghostty";
          binding = "<Ctrl><Shift>Return";
        };

        #"org/gnome/desktop/background" = {
        # picture-uri = "file:///home/sach/wallpapers/l-w.webp";
        # picture-uri-dark = "file:///home/sach/wallpapers/d-w.webp";
        #};
      };

      home.stateVersion = "24.11";
    };
}
