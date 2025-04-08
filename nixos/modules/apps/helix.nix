{ pkgs, ... }:

{
  home-manager.users.sach = { pkgs, ... }: {
    programs.helix = {
      enable = true;
      settings = {
        theme = "autumn_night_transparent";
        editor.cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
      # languages.language = [
      #   {
      #     name = "nix";
      #     scope = "source.nix";
      #     file-types = [ "nix" ];
      #     auto-format = true;
      #     formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
      #   }
      #   {
      #     name = "nixd";
      #     scope = "source.nix";
      #     file-types = [ "nix" ];
      #     auto-format = true;
      #     formatter.command = "${pkgs.nixfmt}/bin/nixd";
      #   }
      #   {
      #     name = "rust-analyzer";
      #     scope = "source.rust";
      #     file-types = [ "rs" ];
      #     auto-format = true;
      #     formatter.command = "${pkgs.nixfmt}/bin/rust-analyzer";
      #   }
      #   {
      #     name = "typescript-language-server";
      #     scope = "source.ts source.tsx";
      #     file-types = [ "ts" "tsx" ];
      #     auto-format = true;
      #     formatter.command = "${pkgs.nixfmt}/bin/typescript-language-server";
      #   }
      #   {
      #     name = "clangd";
      #     scope = "source.c source.cpp";
      #     file-types = [ "c" "cpp" "h" "hpp" ];
      #     auto-format = true;
      #     formatter.command = "${pkgs.nixfmt}/bin/clangd";
      #   }
      #   {
      #     name = "jdtls";
      #     scope = "source.java";
      #     file-types = [ "java" ];
      #     auto-format = true;
      #     formatter.command = "${pkgs.nixfmt}/bin/jdtls";
      #   }
      #   {
      #     name = "pyright";
      #     scope = "source.python";
      #     file-types = [ "py" ];
      #     auto-format = true;
      #     formatter.command = "${pkgs.nixfmt}/bin/pyright";
      #   }
      # ];
      extraConfigFiles = {
        "languages.toml" = {
          text = ''
            [language-server.rust-analyzer.config.check]
            command = "clippy"

            [language-server.rust-analyzer.config.cargo]
            features = "all"
          '';
        };
      };
      themes = {
        autumn_night_transparent = {
          "inherits" = "autumn_night";
          "ui.background" = { };
        };
      };
    };
  };
}
