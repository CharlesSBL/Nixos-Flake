{ inputs, username, host, ... }: {
  imports = [
    ./git.nix
    ./helix
    ./lazygit.nix
    # ./rider.nix
    ./scripts
    ./vscodium.nix
    ./zed
  ];
}
