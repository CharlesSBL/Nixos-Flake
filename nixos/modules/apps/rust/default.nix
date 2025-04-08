{ pkgs, ... }:

{
  home-manager.users.sach = { pkgs, ... }: {
    home = {
      packages = with pkgs; [
        # Rust toolchain installer
        rustup
        # Rust (rust-analyzer)
        rust-analyzer
      ];

      stateVersion = "24.11";
    };


    # Set up Rust environment
    programs.rustup = {
      enable = true;
      components = [ "rust-analyzer" ]; # Adds rust-analyzer to the toolchain
    };
  };
}
