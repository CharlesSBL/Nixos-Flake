# PATH: "/etc/nixos/modules/user-packages-dev.nix"
{ pkgs, ... }:

{
  users.users.sach.packages = with pkgs;
    let
      # Language servers and tools
      languageServers = [
        nixd
        nil

        # Rust (rust-analyzer)
        rust-analyzer

        # JavaScript/TypeScript (typescript-language-server)
        typescript-language-server

        # C/C++ (clangd or ccls)
        clang-tools # Includes clangd
        # OR
        ccls

        # Java (jdtls, requires manual setup)
        jdt-language-server

        # Python (pyright or python-lsp-server)
        pyright
        # nil # Language server for Nix development
        # elixir_ls # Language server for Elixir development
        # typescript-language-server # Language server for TypeScript/JavaScript development
        # python312Packages.python-lsp-server # Language server for Python development
      ];

      # Programming languages and runtimes
      languages = [
        # elixir_1_18 # Elixir programming language and runtime
        nodejs_23 # Node.js JavaScript runtime
        pnpm # Fast, disk space efficient package manager for Node.js
        python314 # Python programming language interpreter
        rustup # Rust toolchain installer
        openjdk # Java Development Kit
        dotnet-sdk # .NET Core SDK
        # swift # Swift programming language
      ];

      # Build tools and debuggers
      buildTools = [
        cmake # Cross-platform build system generator
        clang # C/C++ compiler frontend for LLVM
        doxygen # Documentation generator for multiple languages
        gdb # GNU debugger
        gnumake # GNU Make build automation tool
        meson # High performance build system
        ninja # Small build system focused on speed
        valgrind # Debugging and profiling tool suite
        boost # C++ library collection
      ];

      # Version control
      vcsTools = [
        git # Distributed version control system
        gh # GitHub CLI tool
      ];

      # Editors and IDEs
      editors = [
        # vim # Terminal-based text editor
        # vscode # Modern code editor
        zed-editor # Fast, collaborative code editor
        # jetbrains.idea-community-bin # IntelliJ IDEA Community Edition
        # android-studio # Android development IDE
        ghostty # GPU-accelerated terminal emulator
      ];

    in languageServers ++ languages ++ buildTools ++ vcsTools ++ editors;
}
