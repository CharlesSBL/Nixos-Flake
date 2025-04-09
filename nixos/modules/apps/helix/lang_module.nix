{ pkgs, ... }:

{
  home-manager.users.sach = { pkgs, ... }: {
    home.packages = with pkgs; [
      # nix
      nixfmt-rfc-style
      nixpkgs-fmt
      nixd
      nil

      # js
      vscode-langservers-extracted # html/css server
      typescript-language-server
      nodePackages.prettier # formater
      typescript
      nodejs_23
      pnpm
      eslint

      # c/cpp
      llvmPackages_19.clang-unwrapped
      libgcc
      lldb # debugger
      ccls # lang server

      # java
      jdt-language-server # lang server
      google-java-format # formatter
      zulu8
      gradle

      # C-sharp
      dotnet-sdk
      mono # open-source dotnet
      csharp-ls # lang server

      # python
      black # formatter
      python312
      pyright # type checker
      python312Packages.pygls # lang server
      python312Packages.pip # pip
      isort

      # go
      go
      gopls # server
      golines

      # php
      php
      phpactor
      intelephense
      vscode-extensions.xdebug.php-debug

      # swift
      swift
      sourcekit-lsp # lang server
      vscode-extensions.sswg.swift-lang

      # Databases
      sqlite
      postgresql
      mariadb
      # mysql84

      # other
      yarn
      pandoc # Conversion formats
      emmet-ls
      markdownlint-cli
      tree-sitter

      # bash
      bash
      bash-language-server

      # kotlin
      kotlin-language-server
      kotlin-native # compile to binary code
      kotlin

      # julia
      emacsPackages.lsp-julia
      julia
    ];
  };
}

# Package managers and dependencies
# boost
# glibc
# libgcc
# System utilities
# coreutils
#
# Build tools and debuggers
# gnumake
# meson
# ninja
# lldb
# gdb
# valgrind
# doxygen
