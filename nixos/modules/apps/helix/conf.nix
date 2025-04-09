{ pkgs, ... }:

{
  home-manager.users.sach = { pkgs, ... }: {
    # TODO: [ CharlesSBL ]
    # make separate file for formatters and languages

    home.packages = with pkgs; [
      nixfmt-rfc-style
      nodePackages.prettier
      clang-tools
      google-java-format
      python312Packages.black
      lldb
    ];

    xdg.configFile."helix/languages.toml".text = ''
      # Language Server Configurations
      [language-server.rust-analyzer]
      command = "rust-analyzer"

      [language-server.clangd]
      command = "clangd"

      [language-server.jdtls]
      command = "jdtls"

      [language-server.typescript-language-server]
      command = "typescript-language-server"
      args = ["--stdio"]

      [language-server.vscode-html-language-server]
      command = "vscode-html-language-server"
      args = ["--stdio"]

      [language-server.vscode-css-language-server]
      command = "vscode-css-language-server"
      args = ["--stdio"]

      [language-server.pylsp]
      command = "pylsp"

      [language-server.julia-language-server]
      command = "julia"
      args = ["--project=@.", "--startup-file=no", "--history-file=no", "-e", "using LanguageServer; runserver()"]

      [language-server.bash-language-server]
      command = "bash-language-server"
      args = ["start"]

      [language-server.marksman]
      command = "marksman"

      [language-server.intelephense]
      command = "intelephense"
      args = ["--stdio"]

      [language-server.sql-language-server]
      command = "sql-language-server"
      args = ["up", "--method", "stdio"]

      [language-server.gopls]
      command = "gopls"

      [language-server.sourcekit-lsp]
      command = "sourcekit-lsp"

      [language-server.kotlin-language-server]
      command = "kotlin-language-server"

      [language-server.omnisharp]
      command = "omnisharp"
      args = ["--languageserver"]

      # Language Configurations
      [[language]]
      name = "rust"
      scope = "source.rust"
      file-types = ["rs"]
      comment-tokens = ["//"]
      block-comment-tokens = { start = "/*", end = "*/" }
      indent = { tab-width = 4, unit = "    " }
      language-servers = ["rust-analyzer"]

      [[language]]
      name = "c"
      scope = "source.c"
      file-types = ["c"]
      comment-tokens = ["//"]
      block-comment-tokens = { start = "/*", end = "*/" }
      indent = { tab-width = 4, unit = "    " }
      language-servers = ["clangd"]

      [[language]]
      name = "cpp"
      scope = "source.cpp"
      file-types = ["cpp", "cc", "cxx", "h", "hpp"]
      comment-tokens = ["//"]
      block-comment-tokens = { start = "/*", end = "*/" }
      indent = { tab-width = 4, unit = "    " }
      language-servers = ["clangd"]

      [[language]]
      name = "java"
      scope = "source.java"
      file-types = ["java"]
      comment-tokens = ["//"]
      block-comment-tokens = { start = "/*", end = "*/" }
      indent = { tab-width = 4, unit = "    " }
      language-servers = ["jdtls"]

      [[language]]
      name = "javascript"
      scope = "source.js"
      file-types = ["js", "jsx"]
      comment-tokens = ["//"]
      block-comment-tokens = { start = "/*", end = "*/" }
      indent = { tab-width = 2, unit = "  " }
      language-servers = ["typescript-language-server"]

      [[language]]
      name = "typescript"
      scope = "source.ts"
      file-types = ["ts", "tsx"]
      comment-tokens = ["//"]
      block-comment-tokens = { start = "/*", end = "*/" }
      indent = { tab-width = 2, unit = "  " }
      language-servers = ["typescript-language-server"]

      [[language]]
      name = "html"
      scope = "text.html"
      file-types = ["html"]
      block-comment-tokens = { start = "<!--", end = "-->" }
      indent = { tab-width = 2, unit = "  " }
      language-servers = ["vscode-html-language-server"]

      [[language]]
      name = "css"
      scope = "source.css"
      file-types = ["css"]
      block-comment-tokens = { start = "/*", end = "*/" }
      indent = { tab-width = 2, unit = "  " }
      language-servers = ["vscode-css-language-server"]

      [[language]]
      name = "python"
      scope = "source.python"
      file-types = ["py"]
      comment-tokens = ["#"]
      indent = { tab-width = 4, unit = "    " }
      language-servers = ["pylsp"]

      [[language]]
      name = "julia"
      scope = "source.julia"
      file-types = ["jl"]
      comment-tokens = ["#"]
      block-comment-tokens = { start = "#=", end = "=#" }
      indent = { tab-width = 4, unit = "    " }
      language-servers = ["julia-language-server"]

      [[language]]
      name = "shell"
      scope = "source.sh"
      file-types = ["sh"]
      comment-tokens = ["#"]
      indent = { tab-width = 2, unit = "  " }
      language-servers = ["bash-language-server"]

      [[language]]
      name = "markdown"
      scope = "text.md"
      file-types = ["md"]
      block-comment-tokens = { start = "<!--", end = "-->" }
      indent = { tab-width = 4, unit = "    " }
      language-servers = ["marksman"]

      [[language]]
      name = "php"
      scope = "source.php"
      file-types = ["php"]
      comment-tokens = ["//", "#"]
      block-comment-tokens = { start = "/*", end = "*/" }
      indent = { tab-width = 4, unit = "    " }
      language-servers = ["intelephense"]

      [[language]]
      name = "sql"
      scope = "source.sql"
      file-types = ["sql"]
      comment-tokens = ["--"]
      block-comment-tokens = { start = "/*", end = "*/" }
      indent = { tab-width = 4, unit = "    " }
      language-servers = ["sql-language-server"]

      [[language]]
      name = "go"
      scope = "source.go"
      file-types = ["go"]
      comment-tokens = ["//"]
      block-comment-tokens = { start = "/*", end = "*/" }
      indent = { tab-width = 4, unit = "    " }
      language-servers = ["gopls"]

      [[language]]
      name = "swift"
      scope = "source.swift"
      file-types = ["swift"]
      comment-tokens = ["//"]
      block-comment-tokens = { start = "/*", end = "*/" }
      indent = { tab-width = 4, unit = "    " }
      language-servers = ["sourcekit-lsp"]

      [[language]]
      name = "kotlin"
      scope = "source.kotlin"
      file-types = ["kt"]
      comment-tokens = ["//"]
      block-comment-tokens = { start = "/*", end = "*/" }
      indent = { tab-width = 4, unit = "    " }
      language-servers = ["kotlin-language-server"]

      [[language]]
      name = "csharp"
      scope = "source.cs"
      file-types = ["cs"]
      comment-tokens = ["//"]
      block-comment-tokens = { start = "/*", end = "*/" }
      indent = { tab-width = 4, unit = "    " }
      language-servers = ["omnisharp"]
    '';
  };
}
