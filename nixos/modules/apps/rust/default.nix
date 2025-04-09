{ pkgs, ... }:

{
  home-manager.users.sach = { pkgs, ... }: {
    home = {
      packages = with pkgs; [
        # Rust toolchain installer
        rustup
        # core utils rewritten in rust
        uutils-coreutils-noprefix
      ];


    };

    home.stateVersion = "24.11";
  };
}
