{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ keyd ]; # Installs the keyd package

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            leftctrl = "leftalt";
            leftalt = "leftctrl";
          };
        };
      };
    };
  };
}
