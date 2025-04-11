{ pkgs, ... }:
{
  # service to swap keys
  home.packages = with pkgs; [ keyd ]; # Installs the keyd package

  services.keyd = {
    enable = true; # Enables the keyd service
    extraConfig = ''
      [ids]
      *

      [main]
      leftctrl = leftalt
      leftalt = leftctrl
    '';
  };
}
