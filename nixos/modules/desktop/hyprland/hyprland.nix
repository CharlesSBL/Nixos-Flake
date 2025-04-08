{ pkgs, ... }:
{
  home-manager.users.sach = { ... }: {
    home.packages = with pkgs; [
      swww
      hyprpicker
      grim
      slurp
      wl-clip-persist
      cliphist
      wf-recorder
      glib
      wayland
      direnv
    ];

    systemd.user.targets.hyprland-session.Unit.Wants = [
      "xdg-desktop-autostart.target"
    ];
    wayland.windowManager.hyprland = {
      enable = true;
      package = null;
      portalPackage = null;

      xwayland = {
        enable = true;
        # hidpi = true;
      };
      # enableNvidiaPatches = false;
      systemd.enable = true;
    };
  };
}
