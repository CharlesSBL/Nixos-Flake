```nix

{ config, pkgs, ... }: {
  # Other existing configurations...

  users.users.username = {
    isNormalUser = true; # Creates a user with home directory and default group
    description = "Full Name"; # Optional user description (e.g., "John Doe")
    extraGroups = [ "wheel" "networkmanager" ]; # Add user to groups (e.g., sudo, networkmanager)
    shell = pkgs.zsh; # Optional: Set the user's shell (ensure the shell is installed)
    # Set a password (choose ONE method below)
    # hashedPassword = "<hashed-password>"; # Securely hashed password (recommended)
    initialPassword = "temp-password"; # Temporary password (user should change this)
    openssh.authorizedKeys.keys = [ "ssh-public-key" ]; # Optional: SSH public keys
  };

  # Ensure required packages are installed (e.g., zsh if used)
  environment.systemPackages = with pkgs; [ zsh ];

  # Enable shells if necessary (e.g., for zsh, fish)
  programs.zsh.enable = true;

  # Other existing configurations...
}
```

```sh
nix-shell -p mkpasswd --run "mkpasswd -m sha-512"
```

password:
$ertyOk5D/DTtetrtert/AE4cPgCsA6hpL/tertretertNKK.tz3sEe.ktertret/hxIkKPPET4jU.vVYnlerterP/
