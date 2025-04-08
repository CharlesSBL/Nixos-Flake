{ ... }:

{
  services.ollama = {
    enable = false;
    # acceleration = "cuda";
    # Optional: load models on startup
    # loadModels = [ ... ];
  };
}
