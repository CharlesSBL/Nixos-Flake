{ pkgs, ... }:

{
  home-manager.users.sach = { pkgs, ... }: {

    home = {
      packages = with pkgs; [
        # Rust toolchain installer
        rustup # rustup component add rust-analyzer
        gcc_multi

      ];
    };
  };
}
