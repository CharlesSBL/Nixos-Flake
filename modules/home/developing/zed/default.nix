{ ... }: {
  programs.zed-editor.enable = true;
  programs.zed-editor.userSettings = {
    show_edit_predictions = false;
    languages = {
      Nix = {
        show_edit_predictions = false;
      };
    };
    vim_mode = false;
    features = {
      edit_prediction_provider = "zed";
    };
    assistant = {
      default_model = {
        provider = "zed.dev";
        model = "claude-3-5-sonnet-latest";
      };
      version = "2";
    };
    ui_font_size = 16;
    buffer_font_size = 20;
    buffer_font_weight = 900;
    theme = {
      mode = "system";
      light = "Gruvbox Dark Hard";
      dark = "Gruvbox Dark Hard";
    };

    lsp = {
      rust-analyzer = {
        command = "/etc/profiles/per-user/sach/bin/rust-analyzer";
        args = [ ];
        binary = {
          path = "/etc/profiles/per-user/sach/bin/rust-analyzer";
        };
      };
      nil = {
        binary = {
          path = "/etc/profiles/per-user/sach/bin/nil";
        };
        initialization_options = {
          formatting = {
            command = [ "/etc/profiles/per-user/sach/bin/nixpkgs-fmt" ];
          };
        };
      };
      nixd = {
        binary = {
          path = "/etc/profiles/per-user/sach/bin/nixd";
        };
        initialization_options = {
          formatting = {
            command = [ "/etc/profiles/per-user/sach/bin/nixpkgs-fmt" ];
          };
        };
      };
      typescript-language-server = {
        command = "/etc/profiles/per-user/sach/bin/typescript-language-server";
        args = [ "--stdio" ];
        binary = {
          path = "/etc/profiles/per-user/sach/bin/typescript-language-server";
        };
      };
      clangd = {
        command = "/etc/profiles/per-user/sach/bin/clangd";
        args = [ ];
        binary = {
          path = "/etc/profiles/per-user/sach/bin/clangd";
        };
      };
      jdtls = {
        command = "/etc/profiles/per-user/sach/bin/jdtls";
        args = [ ];
        binary = {
          path = "/etc/profiles/per-user/sach/bin/jdtls";
        };
      };
      pyright = {
        command = "/etc/profiles/per-user/sach/bin/pyright";
        args = [ "--stdio" ];
        binary = {
          path = "/etc/profiles/per-user/sach/bin/pyright";
        };
      };
    };
  };
}
