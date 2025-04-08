{ pkgs, ... }:

{
  users.users.sach = {
    isNormalUser = true;
  };

  home-manager.users.sach = { pkgs, ... }: {
    nix = {
      settings.experimental-features = [ "nix-command" "flakes" ];
    };

    home = {
      packages = with pkgs; [
        firefox
        libreoffice
        whitesur-icon-theme
      ];

      stateVersion = "24.11";
    };

    # Git configuration
    programs.git = {
      enable = true;
      userName = "CharlesSBL";
      userEmail = "karl.sobolewski@outlook.com";
    };
  };
}
