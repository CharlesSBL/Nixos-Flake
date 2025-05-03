{ hostname
, config
, pkgs
, host
, ...
}:
{
  programs.zsh = {
    shellAliases = {
      # ------------------------------------------------------------------------------ Utils
      c = "clear";
      cd = "z";
      tt = "gtrash put";
      cat = "bat";
      nano = "micro";
      code = "codium";
      diff = "delta --diff-so-fancy --side-by-side";
      less = "bat";
      y = "yazi";
      # py = "python";
      # ipy = "ipython";
      # icat = "kitten icat";
      dsize = "du -hs";
      pdf = "tdf";
      open = "xdg-open";
      space = "ncdu";
      man = "BAT_THEME='default' batman";

      l = "eza --icons  -a --group-directories-first -1"; # EZA_ICON_SPACING=2
      ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
      tree = "eza --icons --tree --group-directories-first";

      # ------------------------------------------------------------------------------ Nixos
      cdnix = "cd ~/nixflake && codium ~/nixflake";
      ns = "nom-shell --run zsh";
      nd = "nom develop --command zsh";
      nb = "nom build";
      nix-switch = "nh os switch";
      nix-update = "nh os switch --update";
      nix-clean = "nh clean all --keep 5";
      nix-search = "nh search";
      nix-test = "nh os test";

      # ------------------------------------------------------------------------------ my
      nixb = "cd ~/nixflake && sudo nixos-rebuild switch --flake .#nixrach";
      nixg = "cd ~/nixflake && gitup";
      nixs = "nix-shell -p";
      nixc = "nix-collect-garbage && sudo nix-store --optimise";
      nixclean = "sudo nix-collect-garbage -d && sudo nix-store --optimise";

      start-gui = "sudo systemctl start gdm.service";
      stop-gui = "sudo systemctl stop gdm.service";
      to-console = "sudo systemctl isolate multi-user.target";
      to-gui = "sudo systemctl isolate graphical.target";

      sp = "superfile";

      # ------------------------------------------------------------------------------ python
      piv = "python -m venv .venv";
      psv = "source .venv/bin/activate";

      # ollama = "ollama ls && ollama ps";
    };
  };
}
