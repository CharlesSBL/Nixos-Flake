{ pkgs, username, ... }:
{
  services = {
    xserver = {
      enable = false;
      xkb.layout = "us";
    };

    displayManager.autoLogin = {
      # TODO: [ CharlesSBL ]
      # -> change if is not right
      enable = false;
      user = "${username}";
    };
    libinput = {
      enable = true;
    };
  };
  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
