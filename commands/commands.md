```sh
# work with flake
nix flake check
nixos-rebuild build --flake .#nixrach 
nixos-rebuild switch --flake .#nixrach 

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