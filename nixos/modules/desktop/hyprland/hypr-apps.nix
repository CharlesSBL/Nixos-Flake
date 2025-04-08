{ pkgs, ... }:
{
  home-manager.users.sach = { pkgs, ... }: {
    nix = {
      settings.experimental-features = [ "nix-command" "flakes" ];
    };

    home = {
      packages = with pkgs; [
        waybar
        nm-applet
        poweralertd
        wl-paste
        swaync
        hyprctl
        hyprlock
      ];

      stateVersion = "24.11";
    };
  };
}
