{ pkgs, ... }: {
  home-manager.users.sach = { pkgs, ... }: {

    programs.helix.languages = {
      # Language server configurations
      language-server.typescript-language-server = with pkgs.nodePackages; {
        command = "${typescript-language-server}/bin/typescript-language-server";
        args = [ "--stdio" "--tsserver-path=${typescript}/lib/node_modules/typescript/lib" ];
      };

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

      language-server.pyright = {
        command = "${pkgs.pyright}/bin/pyright-langserver";
        args = [ "--stdio" ];
      };

      language-server.bash-language-server = {
        command = "${pkgs.bash-language-server}/bin/bash-language-server";
        args = [ "start" ];
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
        {
          name = "rust";
          scope = "source.rust";
          file-types = [ "rs" ];
          comment-tokens = "//";
          indent.tab-width = 4;
          indent.unit = "    ";
          language-servers = [ "rust-analyzer" ];
          auto-format = false;
        }

        {
          name = "c";
          scope = "source.c";
          file-types = [ "c" "h" ];
          comment-tokens = "//";
          indent.tab-width = 4;
          indent.unit = "    ";
          language-servers = [ "clangd" ];
        }

        {
          name = "cpp";
          scope = "source.cpp";
          file-types = [ "cpp" "hpp" "cxx" "hxx" ];
          comment-tokens = "//";
          indent.tab-width = 4;
          indent.unit = "    ";
          language-servers = [ "clangd" ];
        }

        {
          name = "java";
          scope = "source.java";
          file-types = [ "java" ];
          comment-tokens = "//";
          indent.tab-width = 4;
          indent.unit = "    ";
          language-servers = [ "jdtls" ];
        }

        {
          name = "python";
          scope = "source.python";
          file-types = [ "py" ];
          comment-tokens = "#";
          indent.tab-width = 4;
          indent.unit = "    ";
          language-servers = [ "pyright" ];
        }

        {
          name = "html";
          scope = "text.html";
          file-types = [ "html" "htm" ];
          comment-tokens = "<!--";
          block-comment-tokens.start = "<!--";
          block-comment-tokens.end = "-->";
          indent.tab-width = 2;
          indent.unit = "  ";
        }

        {
          name = "css";
          scope = "source.css";
          file-types = [ "css" ];
          comment-tokens = "/*";
          block-comment-tokens.start = "/*";
          block-comment-tokens.end = "*/";
          indent.tab-width = 2;
          indent.unit = "  ";
        }

        {
          name = "javascript";
          scope = "source.js";
          file-types = [ "js" "jsx" ];
          comment-tokens = "//";
          indent.tab-width = 2;
          indent.unit = "  ";
          language-servers = [ "typescript-language-server" ];
        }

        {
          name = "react";
          scope = "source.jsx";
          file-types = [ "jsx" ];
          comment-tokens = "//";
          indent.tab-width = 2;
          indent.unit = "  ";
          language-servers = [ "typescript-language-server" ];
        }

        {
          name = "csharp";
          scope = "source.cs";
          file-types = [ "cs" ];
          comment-tokens = "//";
          indent.tab-width = 4;
          indent.unit = "    ";
          language-servers = [ "omnisharp" ];
        }

        {
          name = "sh";
          scope = "source.shell";
          file-types = [ "sh" "bash" ];
          shebangs = [ "sh" "bash" ];
          comment-tokens = "#";
          indent.tab-width = 4;
          indent.unit = "    ";
          language-servers = [ "bash-language-server" ];
        }

        {
          name = "markdown";
          scope = "text.md";
          file-types = [ "md" "markdown" ];
          comment-tokens = "<!--";
          block-comment-tokens.start = "<!--";
          block-comment-tokens.end = "-->";
          indent.tab-width = 2;
          indent.unit = "  ";
        }

        {
          name = "typescript";
          scope = "source.ts";
          file-types = [ "ts" "tsx" ];
          comment-tokens = "//";
          indent.tab-width = 2;
          indent.unit = "  ";
          language-servers = [ "typescript-language-server" ];
        }

        {
          name = "php";
          scope = "source.php";
          file-types = [ "php" ];
          comment-tokens = "//";
          indent.tab-width = 4;
          indent.unit = "    ";
          language-servers = [ "intelephense" ];
        }

        {
          name = "sql";
          scope = "source.sql";
          file-types = [ "sql" ];
          comment-tokens = "--";
          indent.tab-width = 4;
          indent.unit = "    ";
        }

        {
          name = "go";
          scope = "source.go";
          file-types = [ "go" ];
          comment-tokens = "//";
          indent.tab-width = 4;
          indent.unit = "    ";
          language-servers = [ "gopls" ];
        }

        {
          name = "swift";
          scope = "source.swift";
          file-types = [ "swift" ];
          comment-tokens = "//";
          indent.tab-width = 4;
          indent.unit = "    ";
          language-servers = [ "sourcekit-lsp" ];
        }

        {
          name = "kotlin";
          scope = "source.kt";
          file-types = [ "kt" "kts" ];
          comment-tokens = "//";
          indent.tab-width = 4;
          indent.unit = "    ";
          language-servers = [ "kotlin-language-server" ];
        }
      ];
    };
  };
}
