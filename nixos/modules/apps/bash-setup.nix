{ ... }:

{
  # Other configuration settings
  environment.etc."bashrc-custom".text = ''
    alias nixb='cd ~/1-Nixos-Flake && sudo nixos-rebuild switch --flake .#nixrach'
    alias nixg='cd ~/1-Nixos-Flake/ && sh ./commands/git-up.sh'
    alias ns='nix-shell -p'

    alias nixc='nix-collect-garbage'
    alias nixclean='sudo nix-collect-garbage -d && sudo nix-store --optimise'

    # Display manager control
    alias start-gui='sudo systemctl start gdm.service'
    alias stop-gui='sudo systemctl stop gdm.service'
    alias to-console='sudo systemctl isolate multi-user.target'
    alias to-gui='sudo systemctl isolate graphical.target'
  '';
}
