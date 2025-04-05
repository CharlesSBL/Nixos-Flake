# PATH: "/etc/nixos/modules/user-packages-dev.nix"
{ config, pkgs, ... }:

{
  users.users.sach.packages = with pkgs; [
    # Zed tools (excluding duplicates like rustc/cargo/rustup)
    zed-editor
    nil
    elixir_ls
    elixir_1_18
    nodejs_23
    typescript-language-server
    python312Packages.python-lsp-server
    pnpm
    python314
    # Use rustup instead of individual rustc/cargo to avoid collisions
    rustup
    # Development tools
    cmake
    clang
    doxygen
    gdb
    gnumake
    meson
    ninja
    valgrind
    boost
    openjdk
    dotnet-sdk
    swift
    git
    gh
    vim
    # Text editors and IDEs
    vscode
    jetbrains.idea-community-bin
    android-studio
    ghostty
  ];
}
