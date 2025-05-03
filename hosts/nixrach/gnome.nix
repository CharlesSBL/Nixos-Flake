{ ... }: {
  services.xserver = {
    # enable = true;
    displayManager.gdm.enable = false;
    desktopManager.gnome.enable = false;
    desktopManager.xfce.enable = false;
  };

  # services.xserver.xkb.options = "ctrl:swap_lalt_lctrl";

  services.gnome = {
    core-utilities.enable = false;
    localsearch.enable = false;
    # tinysparql.enable = false;
  };
}
