{ config, pkgs, ... }:

{
  # Other configuration settings
  environment.etc."bashrc-custom".text = ''
    alias build-sys='sudo nixos-rebuild switch'
    alias up-sys='sudo nixos-rebuild switch --upgrade'
    alias clean-sys='sudo nix-collect-garbage'
    alias clean-obs='rm -rf ~/.config/obs-studio && rm -rf ~/.cache/obs-studio && rm -rf ~/.local/share/obs-studio'
    alias git-conf='cd ~/.nix-conf/NixOS-Config/ && cp -r /etc/nixos/ ./ && git add . && git commit -m "update nix conf" && git push'

    # Display manager control
    alias start-gui='sudo systemctl start gdm.service'
    alias stop-gui='sudo systemctl stop gdm.service'
    alias to-console='sudo systemctl isolate multi-user.target'
    alias to-gui='sudo systemctl isolate graphical.target'
'';
}
