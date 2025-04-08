{ ... }:

{
  imports = [
    ./android-cam.nix
    ./bash-setup.nix
    ./ollama-service.nix
    ./tor-conf.nix
    ./helix.nix
  ];
}
