nixos-rebuild build --flake .
nixos-rebuild switch --flake .#mySystem 
# Run Visual Studio Code with elevated privileges, disabling the sandbox and specifying a user data directory
sudo code --no-sandbox --user-data-dir

git add . && git commit -m "Update configuration"