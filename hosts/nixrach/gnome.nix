{ ... }: {
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  services.xserver.xkb.options = "ctrl:swap_lalt_lctrl";

  services.gnome = {
    core-utilities.enable = false;
    localsearch.enable = false;
    tinysparql.enable = false;
  };
}
