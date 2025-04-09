{ pkgs, ... }:
{
  home-manager.users.sach = { ... }: {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ll = "ls -l";
        ls = "ls";
        la = "ls -la";
        tree = "tree";
        cat = "bat";
        update = "sudo nixos-rebuild switch";
        grep = "rg";
      };

      plugins = [
        {
          name = "powerlevel10k"; # Name of the plugin/theme
          src = pkgs.zsh-powerlevel10k; # Nix package for Powerlevel10k
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme"; # Path to the theme file
        }
      ];

      oh-my-zsh = {
        enable = true;
        # theme = "robbyrussell";
        plugins = [
          "git"
          "npm"
          "history"
          "node"
          "rust"
          "deno"
          "colored-man-pages"
          "z"
          "dirhistory"
        ];
      };

      # .zshrc
      initExtra = ''
        export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store";
        export ZK_NOTEBOOK_DIR="~/stuff/notes";
        export DIRENV_LOG_FORMAT="";
        export FZF_BASE=${pkgs.fzf}/share/fzf;
        bindkey '^ ' autosuggest-accept

        # Better completion display
        zstyle ':completion:*' menu select
        zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}

        edir() { tar -cz $1 | age -p > $1.tar.gz.age && rm -rf $1 &>/dev/null && echo "$1 encrypted" }
        ddir() { age -d $1 | tar -xz && rm -rf $1 &>/dev/null && echo "$1 decrypted" }

        # Source powerlevel10k config if it exists
        [[ -f ~/.config/zsh/.p10k.zsh ]] && source ~/.config/zsh/.p10k.zsh
      '';

      dirHashes = {
        dots = "$HOME/.config/nixos";
        stuff = "$HOME/stuff";
        media = "/run/media/$USER";
        junk = "$HOME/stuff/other";
      };

      history = {
        save = 10000;
        size = 10000;
        path = "$HOME/.cache/zsh_history";
        expireDuplicatesFirst = true;
        ignoreDups = true;
        ignoreSpace = true;
      };

      dotDir = ".config/zsh";
    };

    home.stateVersion = "24.11";
  };
}
