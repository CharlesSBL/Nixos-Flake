{ ... }:

{
  services.ollama = {
    enable = true;
    # acceleration = "cuda";
    # Optional: load models on startup
    # loadModels = [ ... ];
  };

  services.open-webui.enable = true;
}
