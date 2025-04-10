{ ... }:

{
  services.ollama = {
    enable = true;
    # acceleration = "cuda";
    # Optional: load models on startup
    loadModels = [
      "deepcoder:1.5b-preview-q8_0"
    ];
  };

  services.open-webui.enable = true;
}
