{ pkgs, ... }:

{
  home-manager.users.sach = { pkgs, ... }: {
    home = {
      packages = with pkgs; [
        # Rust toolchain installer
        rustup
      ];

      stateVersion = "24.11";
    };
  };
}
