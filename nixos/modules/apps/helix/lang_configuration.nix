{ pkgs, ... }:

{
  home-manager.users.sach = { pkgs, ... }: {


    # Directly define languages.toml
    xdg.configFile."helix/languages.toml".text = ''
      [[language]]
      auto-format = false
      comment-tokens = "//"
      file-types = ["rs"]
      language-servers = ["rust-analyzer"]
      name = "rust"
      scope = "source.rust"

        [language.indent]
        tab-width = 4
        unit = "    "

      [[language]]
      comment-tokens = "//"
      file-types = ["c", "h"]
      language-servers = ["clangd"]
      name = "c"
      scope = "source.c"

        [language.indent]
        tab-width = 4
        unit = "    "

      [[language]]
      comment-tokens = "//"
      file-types = ["cpp", "hpp", "cxx", "hxx"]
      language-servers = ["clangd"]
      name = "cpp"
      scope = "source.cpp"

        [language.indent]
        tab-width = 4
        unit = "    "

      [[language]]
      comment-tokens = "//"
      file-types = ["java"]
      language-servers = ["jdtls"]
      name = "java"
      scope = "source.java"

        [language.indent]
        tab-width = 4
        unit = "    "

      [[language]]
      comment-tokens = "#"
      file-types = ["py"]
      language-servers = ["pyright"]
      name = "python"
      scope = "source.python"

        [language.indent]
        tab-width = 4
        unit = "    "

      [[language]]
      comment-tokens = "<!--"
      file-types = ["html", "htm"]
      name = "html"
      scope = "text.html"

        [language.block-comment-tokens]
        end = "-->"
        start = "<!--"

        [language.indent]
        tab-width = 2
        unit = "  "

      [[language]]
      comment-tokens = "/*"
      file-types = ["css"]
      name = "css"
      scope = "source.css"

        [language.block-comment-tokens]
        end = "*/"
        start = "/*"

        [language.indent]
        tab-width = 2
        unit = "  "

      [[language]]
      comment-tokens = "//"
      file-types = ["js", "jsx"]
      language-servers = ["typescript-language-server"]
      name = "javascript"
      scope = "source.js"

        [language.indent]
        tab-width = 2
        unit = "  "

      [[language]]
      comment-tokens = "//"
      file-types = ["jsx"]
      language-servers = ["typescript-language-server"]
      name = "react"
      scope = "source.jsx"

        [language.indent]
        tab-width = 2
        unit = "  "

      [[language]]
      comment-tokens = "//"
      file-types = ["cs"]
      language-servers = ["omnisharp"]
      name = "csharp"
      scope = "source.cs"

        [language.indent]
        tab-width = 4
        unit = "    "

      [[language]]
      comment-tokens = "#"
      file-types = ["sh", "bash"]
      language-servers = ["bash-language-server"]
      name = "sh"
      scope = "source.shell"
      shebangs = ["sh", "bash"]

        [language.indent]
        tab-width = 4
        unit = "    "

      [[language]]
      comment-tokens = "<!--"
      file-types = ["md", "markdown"]
      name = "markdown"
      scope = "text.md"

        [language.block-comment-tokens]
        end = "-->"
        start = "<!--"

        [language.indent]
        tab-width = 2
        unit = "  "

      [[language]]
      comment-tokens = "//"
      file-types = ["ts", "tsx"]
      language-servers = ["typescript-language-server"]
      name = "typescript"
      scope = "source.ts"

        [language.indent]
        tab-width = 2
        unit = "  "

      [[language]]
      comment-tokens = "//"
      file-types = ["php"]
      language-servers = ["intelephense"]
      name = "php"
      scope = "source.php"

        [language.indent]
        tab-width = 4
        unit = "    "

      [[language]]
      comment-tokens = "--"
      file-types = ["sql"]
      name = "sql"
      scope = "source.sql"

        [language.indent]
        tab-width = 4
        unit = "    "

      [[language]]
      comment-tokens = "//"
      file-types = ["go"]
      language-servers = ["gopls"]
      name = "go"
      scope = "source.go"

        [language.indent]
        tab-width = 4
        unit = "    "

      [[language]]
      comment-tokens = "//"
      file-types = ["swift"]
      language-servers = ["sourcekit-lsp"]
      name = "swift"
      scope = "source.swift"

        [language.indent]
        tab-width = 4
        unit = "    "

      [[language]]
      comment-tokens = "//"
      file-types = ["kt", "kts"]
      language-servers = ["kotlin-language-server"]
      name = "kotlin"
      scope = "source.kt"

        [language.indent]
        tab-width = 4
        unit = "    "

      [language-server.bash-language-server]
      args = ["start"]
      command = "${pkgs.bash-language-server}/bin/bash-language-server"

      [language-server.clangd]
      args = []
      command = "${pkgs.clang-tools}/bin/clangd"

      [language-server.gopls]
      args = []
      command = "${pkgs.go-tools}/bin/gopls"

      [language-server.jdtls]
      args = []
      command = "${pkgs.jdt-language-server}/bin/jdtls"

      [language-server.kotlin-language-server]
      args = []
      command = "${pkgs.kotlin-language-server}/bin/kotlin-language-server"

      [language-server.pyright]
      args = ["--stdio"]
      command = "${pkgs.pyright}/bin/pyright-langserver"

      [language-server.rust-analyzer]
      args = []
      command = "${pkgs.rust-analyzer}/bin/rust-analyzer"

      [language-server.sourcekit-lsp]
      args = []
      command = "${pkgs.swift}/bin/sourcekit-lsp"

      [language-server.typescript-language-server]
      args = ["--stdio", "--tsserver-path=${pkgs.nodePackages.typescript}/lib/node_modules/typescript/lib"]
      command = "${pkgs.nodePackages.typescript-language-server}/bin/typescript-language-server"
    '';

    home.stateVersion = "24.11";
  };
}
