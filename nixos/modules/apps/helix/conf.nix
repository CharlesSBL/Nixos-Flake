{ pkgs, ... }:

{
  home-manager.users.sach = { pkgs, ... }: {
    xdg.configFile."helix/languages.toml".text = ''
      [language-server.nil]
      command = "/etc/profiles/per-user/sach/bin/nil"
      binary.path = "/etc/profiles/per-user/sach/bin/nil"
      initialization_options.formatting.command = ["/etc/profiles/per-user/sach/bin/nixpkgs-fmt"]

      [language-server.nixd]
      command = "/etc/profiles/per-user/sach/bin/nixd"
      binary.path = "/etc/profiles/per-user/sach/bin/nixd"
      initialization_options.formatting.command = ["/etc/profiles/per-user/sach/bin/nixpkgs-fmt"]

      [language-server.rust-analyzer]
      command = "/etc/profiles/per-user/sach/bin/rust-analyzer"
      args = []
      binary.path = "/etc/profiles/per-user/sach/bin/rust-analyzer"
      config.check.command = "clippy"
      config.cargo.features = "all"

      [language-server.typescript-language-server]
      command = "/etc/profiles/per-user/sach/bin/typescript-language-server"
      args = ["--stdio"]
      binary.path = "/etc/profiles/per-user/sach/bin/typescript-language-server"

      [language-server.clangd]
      command = "/etc/profiles/per-user/sach/bin/clangd"
      args = []
      binary.path = "/etc/profiles/per-user/sach/bin/clangd"

      [language-server.jdtls]
      command = "/etc/profiles/per-user/sach/bin/jdtls"
      args = []
      binary.path = "/etc/profiles/per-user/sach/bin/jdtls"

      [language-server.pyright]
      command = "/etc/profiles/per-user/sach/bin/pyright"
      args = ["--stdio"]
      binary.path = "/etc/profiles/per-user/sach/bin/pyright"

      [[language]]
      name = "nix"
      formatter = { command = "nixfmt", args = [] }
    '';
  };
}
