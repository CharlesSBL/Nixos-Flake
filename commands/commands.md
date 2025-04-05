```sh
# This builds the system configuration, which can then be tested or deployed.
nix build .#nixosConfigurations.mySystem.config.system.build.toplevel

# work with flake
nix flake check
nixos-rebuild build --flake .#nixrach
sudo nixos-rebuild switch --flake .#nixrach

# update
nix flake update

# clean up the nixos
nix-collect-garbage
# agressive
sudo nix-collect-garbage -d
sudo nix-collect-garbage --delete-old
# optimize after clean
sudo nix-store --optimise

# run vscode to edit root files
sudo code --no-sandbox --user-data-dir
```
