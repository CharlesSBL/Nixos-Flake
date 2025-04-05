```sh
nixos-rebuild build --flake .
nixos-rebuild switch --flake .#nixrach # change in nixos/modules/system/networking.nix

# simple
nix-collect-garbage
# agressive 
sudo nix-collect-garbage -d
sudo nix-collect-garbage --delete-old
# optimize after clean
sudo nix-store --optimise


sudo code --no-sandbox --user-data-dir
```