{ ... }:
{
  home-manager.users.sach = { ... }: {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      zsh-autoenv.enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ll = "exa -l --icons";
        ls = "exa --icons";
        la = "exa -la --icons";
        tree = "exa --tree --icons";
        cat = "bat";
        update = "sudo nixos-rebuild switch";
        grep = "rg";
      };

      ohMyZsh = {
        enable = true;
        theme = "powerlevel10k/powerlevel10k";
        plugins = [
          "git"
          "npm"
          "history"
          "node"
          "rust"
          "deno"
          "colored-man-pages"
          "zsh-interactive-cd"
          "fzf"
          "z"
          "dirhistory"
        ];
      };

      # .zshrc
      initExtra = ''
        export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store";
        export ZK_NOTEBOOK_DIR="~/stuff/notes";
        export DIRENV_LOG_FORMAT="";
        bindkey '^ ' autosuggest-accept

        # Enable fzf keybindings and completion
        source /usr/share/fzf/key-bindings.zsh
        source /usr/share/fzf/completion.zsh

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
  };
}
