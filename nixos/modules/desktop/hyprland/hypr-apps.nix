{ ... }:
{
  home-manager.users.sach = { pkgs, ... }: {
    nix = {
      settings.experimental-features = [ "nix-command" "flakes" ];
    };

    home = {
      packages = with pkgs; [
        waybar
        poweralertd
        hyprlock
      ];


    };

    home.stateVersion = "24.11";
  };
}
