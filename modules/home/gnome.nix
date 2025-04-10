{ pkgs, ... }:
{
  home.packages = (
    with pkgs;
    [
      evince # pdf
      file-roller # archive
      gnome-text-editor # gedit

      adwaita-icon-theme # Default GNOME icon theme
      gnome-tweaks # Advanced GNOME settings tool
      sysprof # System-wide profiler for Linux
      gnome-extension-manager # GUI tool for managing GNOME shell extensions
    ]
  );

  # Manually set GTK icon theme via config file
  xdg.configFile."gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-icon-theme-name=WhiteSur
  '';

  dconf.settings = {
    "org/gnome/TextEditor" = {
      custom-font = "Maple Mono 15";
      highlight-current-line = true;
      indent-style = "space";
      restore-session = false;
      show-grid = false;
      show-line-numbers = true;
      show-right-margin = false;
      style-scheme = "builder-dark";
      style-variant = "dark";
      tab-width = "uint32 4";
      use-system-font = false;
      wrap-text = false;
    };

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
  };
}
