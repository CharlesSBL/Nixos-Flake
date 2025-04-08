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
        rustup
      ];

      stateVersion = "24.11";
    };

    # Git configuration
    programs.git = {
      enable = true;
      userName = "CharlesSBL";
      userEmail = "karl.sobolewski@outlook.com";
    };

    # Set up Rust environment
    programs.rustup = {
      enable = true;
      components = [ "rust-analyzer" ]; # Adds rust-analyzer to the toolchain
    };
  };
}
