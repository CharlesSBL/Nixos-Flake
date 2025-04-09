{ ... }:

{
  services.ollama = {
    enable = false;
    # acceleration = "cuda";
    # Optional: load models on startup
    # loadModels = [ ... ];
  };

  services.open-webui.enable = true;
}
