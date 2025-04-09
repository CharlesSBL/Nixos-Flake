{ config, pkgs, ... }:

{
  home-manager.users.sach = { pkgs, ... }: {
    home = {
      sessionVariables = {
        EDITOR = "hx";
        BROWSER = "firefox";
        TERMINAL = "ghostty";
        LIBVA_DRIVER_NAME = "i965"; # hardware acceleration for Intel
        WLR_NO_HARDWARE_CURSORS = "1";
        WLR_RENDERER_ALLOW_SOFTWARE = "1";
        CLUTTER_BACKEND = "wayland";
        WLR_RENDERER = "vulkan";
        XDG_CURRENT_DESKTOP = "Hyprland";
        XDG_SESSION_DESKTOP = "Hyprland";
        XDG_SESSION_TYPE = "wayland";
      };
    };
  };
}
