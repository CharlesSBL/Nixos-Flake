{ ... }:

{
  imports = [
    ./android-cam.nix
    ./bash-setup.nix
    ./ollama-service.nix
    ./tor-conf.nix
    ./lang_module.nix
    ./helix
    ./rust
    ./zsh.nix
  ];
}
