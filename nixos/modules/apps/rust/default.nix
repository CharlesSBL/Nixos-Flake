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

      stateVersion = "24.11";
    };
  };
}
