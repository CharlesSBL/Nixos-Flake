{ pkgs, ... }:

{
  home-manager.users.sach = { pkgs, ... }: {
    home.packages = with pkgs; [
      # Formatters and linters
      nixfmt-rfc-style
      nodePackages.prettier
      clang-tools
      google-java-format
      python312Packages.black
      nixpkgs-fmt

      # Build tools and debuggers
      cmake
      gnumake
      meson
      ninja
      lldb
      gdb
      valgrind
      doxygen

      # Compilers and language toolchains
      clang
      gcc
      gpp
      openjdk
      dotnet-sdk
      python314
      nodejs_23
      julia
      php
      go
      swift
      kotlin

      # Language servers
      nixd
      nil
      typescript-language-server
      ccls
      jdt-language-server
      pyright

      # Package managers and dependencies
      pnpm
      npm
      yarn
      python3Packages.pip
      boost
      glibc
      libgcc

      # Databases
      sqlite
      postgresql
      mysql

      # System utilities
      bash
      coreutils
      pandoc
    ];
  };
}
