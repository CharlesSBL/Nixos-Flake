# PATH: "/etc/nixos/modules/user-packages-dev.nix"
{ config, pkgs, ... }:

{
  users.users.sach.packages = with pkgs; let
    # Language servers and tools
    languageServers = [
      nil # Nix
      elixir_ls # Elixir
      typescript-language-server # TypeScript
      python312Packages.python-lsp-server # Python
    ];

    # Programming languages and runtimes
    languages = [
      elixir_1_18
      nodejs_23
      pnpm
      python314
      rustup
      openjdk
      dotnet-sdk
      swift
    ];

    # Build tools and debuggers
    buildTools = [
      cmake
      clang
      doxygen
      gdb
      gnumake
      meson
      ninja
      valgrind
      boost
    ];

    # Version control
    vcsTools = [
      git
      gh
    ];

    # Editors and IDEs
    editors = [
      vim
      vscode
      zed-editor
      jetbrains.idea-community-bin
      android-studio
      ghostty
    ];

  in
    languageServers ++
    languages ++
    buildTools ++
    vcsTools ++
    editors;
}
