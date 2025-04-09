{ pkgs, ... }: {
  home-manager.users.sach = { pkgs, ... }: {

    programs.helix.languages = {
      # Include jdt-language-server in the environment
      extraPackages = [
        pkgs.jdt-language-server
      ];

      # Language server configurations
      language-server.rust-analyzer = {
        command = "${pkgs.rust-analyzer}/bin/rust-analyzer";
        args = [ ];
      };

      language-server.clangd = {
        command = "${pkgs.clang-tools}/bin/clangd";
        args = [ ];
      };

      language-server.jdtls = {
        command = "${pkgs.jdt-language-server}/bin/jdtls";
        args = [ ];
      };

      language-server.typescript-language-server = with pkgs.nodePackages; {
        command = "${typescript-language-server}/bin/typescript-language-server";
        args = [ "--stdio" "--tsserver-path=${typescript}/lib/node_modules/typescript/lib" ];
      };

      language-server.omnisharp = {
        command = "${pkgs.emacsPackages.omnisharp}/bin/omnisharp";
        args = [ ];
      };

      language-server.pyright = {
        command = "${pkgs.pyright}/bin/pyright-langserver";
        args = [ "--stdio" ];
      };

      language-server.julia-lsp = {
        command = "${pkgs.emacsPackages.lsp-julia}/bin/julia-lsp";
        args = [ ];
      };

      language-server.bash-language-server = {
        command = "${pkgs.bash-language-server}/bin/bash-language-server";
        args = [ "start" ];
      };

      language-server.intelephense = {
        command = "${pkgs.intelephense}/bin/intelephense";
        args = [ "--stdio" ];
      };

      language-server.gopls = {
        command = "${pkgs.go-tools}/bin/gopls";
        args = [ ];
      };

      language-server.sourcekit-lsp = {
        command = "${pkgs.swift}/bin/sourcekit-lsp";
        args = [ ];
      };

      language-server.kotlin-language-server = {
        command = "${pkgs.kotlin-language-server}/bin/kotlin-language-server";
        args = [ ];
      };

      # Language-specific configurations
      language = [
        # Rust
        {
          name = "rust";
          scope = "source.rust";
          file-types = [ "rs" ];
          comment-tokens = "//";
          indent = { tab-width = 4; unit = "    "; };
          language-servers = [ "rust-analyzer" ];
          auto-format = false;
        }

        # C
        {
          name = "c";
          scope = "source.c";
          file-types = [ "c" "h" ];
          comment-tokens = "//";
          indent = { tab-width = 4; unit = "    "; };
          language-servers = [ "clangd" ];
        }

        # C++
        {
          name = "cpp";
          scope = "source.cpp";
          file-types = [ "cpp" "hpp" "cxx" "hxx" ];
          comment-tokens = "//";
          indent = { tab-width = 4; unit = "    "; };
          language-servers = [ "clangd" ];
        }

        # Java
        {
          name = "java";
          scope = "source.java";
          file-types = [ "java" ];
          comment-tokens = "//";
          indent = { tab-width = 4; unit = "    "; };
          language-servers = [ "jdtls" ];
        }

        # JavaScript
        {
          name = "javascript";
          scope = "source.js";
          file-types = [ "js" "jsx" ];
          comment-tokens = "//";
          indent = { tab-width = 2; unit = "  "; };
          language-servers = [ "typescript-language-server" ];
        }

        # HTML
        {
          name = "html";
          scope = "text.html";
          file-types = [ "html" "htm" ];
          comment-tokens = "<!--";
          block-comment-tokens = { start = "<!--"; end = "-->"; };
          indent = { tab-width = 2; unit = "  "; };
        }

        # CSS
        {
          name = "css";
          scope = "source.css";
          file-types = [ "css" ];
          comment-tokens = "/*";
          block-comment-tokens = { start = "/*"; end = "*/"; };
          indent = { tab-width = 2; unit = "  "; };
        }

        # React (JSX)
        {
          name = "react";
          scope = "source.jsx";
          file-types = [ "jsx" ];
          comment-tokens = "//";
          indent = { tab-width = 2; unit = "  "; };
          language-servers = [ "typescript-language-server" ];
        }

        # C#
        {
          name = "csharp";
          scope = "source.cs";
          file-types = [ "cs" ];
          comment-tokens = "//";
          indent = { tab-width = 4; unit = "    "; };
          language-servers = [ "omnisharp" ];
        }

        # Python
        {
          name = "python";
          scope = "source.python";
          file-types = [ "py" ];
          comment-tokens = "#";
          indent = { tab-width = 4; unit = "    "; };
          language-servers = [ "pyright" ];
        }

        # Julia
        {
          name = "julia";
          scope = "source.julia";
          file-types = [ "jl" ];
          comment-tokens = "#";
          indent = { tab-width = 4; unit = "    "; };
          language-servers = [ "julia-lsp" ];
        }

        # Shell (sh/bash)
        {
          name = "sh";
          scope = "source.shell";
          file-types = [ "sh" "bash" ];
          shebangs = [ "sh" "bash" ];
          comment-tokens = "#";
          indent = { tab-width = 4; unit = "    "; };
          language-servers = [ "bash-language-server" ];
        }

        # Markdown
        {
          name = "markdown";
          scope = "text.md";
          file-types = [ "md" "markdown" ];
          comment-tokens = "<!--";
          block-comment-tokens = { start = "<!--"; end = "-->"; };
          indent = { tab-width = 2; unit = "  "; };
        }

        # TypeScript
        {
          name = "typescript";
          scope = "source.ts";
          file-types = [ "ts" "tsx" ];
          comment-tokens = "//";
          indent = { tab-width = 2; unit = "  "; };
          language-servers = [ "typescript-language-server" ];
        }

        # PHP
        {
          name = "php";
          scope = "source.php";
          file-types = [ "php" ];
          comment-tokens = "//";
          indent = { tab-width = 4; unit = "    "; };
          language-servers = [ "intelephense" ];
        }

        # SQL
        {
          name = "sql";
          scope = "source.sql";
          file-types = [ "sql" ];
          comment-tokens = "--";
          indent = { tab-width = 4; unit = "    "; };
        }

        # Go
        {
          name = "go";
          scope = "source.go";
          file-types = [ "go" ];
          comment-tokens = "//";
          indent = { tab-width = 4; unit = "    "; };
          language-servers = [ "gopls" ];
        }

        # Swift
        {
          name = "swift";
          scope = "source.swift";
          file-types = [ "swift" ];
          comment-tokens = "//";
          indent = { tab-width = 4; unit = "    "; };
          language-servers = [ "sourcekit-lsp" ];
        }

        # Kotlin
        {
          name = "kotlin";
          scope = "source.kt";
          file-types = [ "kt" "kts" ];
          comment-tokens = "//";
          indent = { tab-width = 4; unit = "    "; };
          language-servers = [ "kotlin-language-server" ];
        }
      ];
    };
  };
}
