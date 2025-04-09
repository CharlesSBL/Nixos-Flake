{ pkgs, ... }:

{
  home-manager.users.sach = { pkgs, ... }: {
    # TODO: [ CharlesSBL ]
    # make separate file for formatters and languages

    xdg.configFile."helix/languages.toml".text = ''
      # Note: This configuration assumes you have the necessary language servers
      # installed and available in your $PATH.

      # nix
      [[language]]
      name = "nix"
      formatter = { command = "nixfmt", args = [] }

      # Rust
      [[language]]
      name = "rust"
      scope = "source.rust"
      file-types = ["rs"]
      comment-tokens = "//"
      indent = { tab-width = 4, unit = "    " }
      language-servers = ["rust-analyzer"]
      formatter = { command = "rustfmt", args = [] }

      # C
      [[language]]
      name = "c"
      scope = "source.c"
      file-types = ["c", "h"]
      comment-tokens = "//"
      indent = { tab-width = 4, unit = "    " }
      language-servers = ["clangd"]
      formatter = { command = "clang-format", args = [] }

      # C++
      [[language]]
      name = "cpp"
      scope = "source.cpp"
      file-types = ["cpp", "hpp", "cxx", "hxx"]
      comment-tokens = "//"
      indent = { tab-width = 4, unit = "    " }
      language-servers = ["clangd"]
      formatter = { command = "clang-format", args = [] }

      # Java
      [[language]]
      name = "java"
      scope = "source.java"
      file-types = ["java"]
      comment-tokens = "//"
      indent = { tab-width = 4, unit = "    " }
      language-servers = ["jdtls"]
      formatter = { command = "google-java-format", args = [] }

      # JavaScript
      [[language]]
      name = "javascript"
      scope = "source.js"
      file-types = ["js", "jsx"]
      comment-tokens = "//"
      indent = { tab-width = 2, unit = "  " }
      language-servers = ["typescript-language-server"]
      formatter = { command = "prettier", args = ["--parser", "javascript"] }

      # HTML
      [[language]]
      name = "html"
      scope = "text.html"
      file-types = ["html", "htm"]
      comment-tokens = "<!--"
      block-comment-tokens = { start = "<!--", end = "-->" }
      indent = { tab-width = 2, unit = "  " }
      formatter = { command = "prettier", args = ["--parser", "html"] }

      # CSS
      [[language]]
      name = "css"
      scope = "source.css"
      file-types = ["css"]
      comment-tokens = "/*"
      block-comment-tokens = { start = "/*", end = "*/" }
      indent = { tab-width = 2, unit = "  " }
      formatter = { command = "prettier", args = ["--parser", "css"] }

      # React (JSX)
      [[language]]
      name = "react"
      scope = "source.jsx"
      file-types = ["jsx"]
      comment-tokens = "//"
      indent = { tab-width = 2, unit = "  " }
      language-servers = ["typescript-language-server"]
      formatter = { command = "prettier", args = ["--parser", "jsx"] }

      # C#
      [[language]]
      name = "csharp"
      scope = "source.cs"
      file-types = ["cs"]
      comment-tokens = "//"
      indent = { tab-width = 4, unit = "    " }
      language-servers = ["omnisharp"]
      formatter = { command = "prettier", args = ["--parser", "csharp"] }

      # Python
      [[language]]
      name = "python"
      scope = "source.python"
      file-types = ["py"]
      comment-tokens = "#"
      indent = { tab-width = 4, unit = "    " }
      language-servers = ["pyright"]
      formatter = { command = "black", args = [] }

      # Julia
      [[language]]
      name = "julia"
      scope = "source.julia"
      file-types = ["jl"]
      comment-tokens = "#"
      indent = { tab-width = 4, unit = "    " }
      language-servers = ["julia-lsp"]
      formatter = { command = "prettier", args = ["--parser", "julia"] }

      # Shell (sh)
      [[language]]
      name = "sh"
      scope = "source.shell"
      file-types = ["sh", "bash"]
      shebangs = ["sh", "bash"]
      comment-tokens = "#"
      indent = { tab-width = 4, unit = "    " }
      language-servers = ["bash-language-server"]
      formatter = { command = "prettier", args = ["--parser", "sh"] }

      # Markdown (md)
      [[language]]
      name = "markdown"
      scope = "text.md"
      file-types = ["md", "markdown"]
      comment-tokens = "<!--"
      block-comment-tokens = { start = "<!--", end = "-->" }
      indent = { tab-width = 2, unit = "  " }

      # TypeScript
      [[language]]
      name = "typescript"
      scope = "source.ts"
      file-types = ["ts", "tsx"]
      comment-tokens = "//"
      indent = { tab-width = 2, unit = "  " }
      language-servers = ["typescript-language-server"]
      formatter = { command = "prettier", args = ["--parser", "typescript"] }

      # PHP
      [[language]]
      name = "php"
      scope = "source.php"
      file-types = ["php"]
      comment-tokens = "//"
      indent = { tab-width = 4, unit = "    " }
      language-servers = ["intelephense"]
      formatter = { command = "prettier", args = ["--parser", "php"] }

      # SQL
      [[language]]
      name = "sql"
      scope = "source.sql"
      file-types = ["sql"]
      comment-tokens = "--"
      indent = { tab-width = 4, unit = "    " }
      formatter = { command = "prettier", args = ["--parser", "sql"] }

      # Go
      [[language]]
      name = "go"
      scope = "source.go"
      file-types = ["go"]
      comment-tokens = "//"
      indent = { tab-width = 4, unit = "    " }
      language-servers = ["gopls"]
      formatter = { command = "prettier", args = ["--parser", "go"] }

      # Swift
      [[language]]
      name = "swift"
      scope = "source.swift"
      file-types = ["swift"]
      comment-tokens = "//"
      indent = { tab-width = 4, unit = "    " }
      language-servers = ["sourcekit-lsp"]
      formatter = { command = "prettier", args = ["--parser", "swift"] }

      # Kotlin
      [[language]]
      name = "kotlin"
      scope = "source.kt"
      file-types = ["kt", "kts"]
      comment-tokens = "//"
      indent = { tab-width = 4, unit = "    " }
      language-servers = ["kotlin-language-server"]
      formatter = { command = "prettier", args = ["--parser", "kotlin"] }


      # Language Server Configurations
      [language-server.rust-analyzer]
      command = "/etc/profiles/per-user/sach/bin/rust-analyzer"
      args = []
      binary.path = "/etc/profiles/per-user/sach/bin/rust-analyzer"
      config.check.command = "clippy"
      config.cargo.features = "all"

      [language-server.clangd]
      command = "/etc/profiles/per-user/sach/bin/clangd"
      args = []
      binary.path = "/etc/profiles/per-user/sach/bin/clangd"

      [language-server.jdtls]
      command = "/etc/profiles/per-user/sach/bin/jdtls"
      args = []
      binary.path = "/etc/profiles/per-user/sach/bin/jdtls"

      [language-server.typescript-language-server]
      command = "/etc/profiles/per-user/sach/bin/typescript-language-server"
      args = ["--stdio"]
      binary.path = "/etc/profiles/per-user/sach/bin/typescript-language-server"

      [language-server.omnisharp]
      command = "omnisharp"

      [language-server.pyright]
      command = "/etc/profiles/per-user/sach/bin/pyright"
      args = ["--stdio"]
      binary.path = "/etc/profiles/per-user/sach/bin/pyright"

      [language-server.julia-lsp]
      command = "julia-lsp"

      [language-server.bash-language-server]
      command = "bash-language-server"
      args = ["start"]

      [language-server.intelephense]
      command = "intelephense"
      args = ["--stdio"]

      [language-server.gopls]
      command = "gopls"

      [language-server.sourcekit-lsp]
      command = "sourcekit-lsp"

      [language-server.kotlin-language-server]
      command = "kotlin-language-server"

      [language-server.nil]
      command = "/etc/profiles/per-user/sach/bin/nil"
      binary.path = "/etc/profiles/per-user/sach/bin/nil"
      initialization_options.formatting.command = ["/etc/profiles/per-user/sach/bin/nixpkgs-fmt"]

      [language-server.nixd]
      command = "/etc/profiles/per-user/sach/bin/nixd"
      binary.path = "/etc/profiles/per-user/sach/bin/nixd"
      initialization_options.formatting.command = ["/etc/profiles/per-user/sach/bin/nixpkgs-fmt"]
    '';
  };
}
