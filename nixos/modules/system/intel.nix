{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.hardware.cpu.intel.gen11;
in

{


  # Define module options
    options.hardware.cpu.intel.gen11 = {
      enable = mkEnableOption "configuration for 11th Gen Intel CPUs (Tiger Lake/Rocket Lake)";

      graphicsSupport = mkOption {
        type = types.bool;
        default = true;
        description = "Whether to install drivers for integrated graphics.";
      };

      optimizeBuilds = mkOption {
        type = types.bool;
        default = true;
        description = "Whether to optimize package builds for this CPU architecture.";
      };
    };
# Configuration applied when the module is enabled
    config = mkIf cfg.enable {
      boot.kernelModules = ["kvm-intel"];
      hardware.cpu.intel.updateMicrocode = true;
      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

      # Set a default CPU frequency governor (fallback if auto-cpufreq is disabled)
      powerManagement.cpuFreqGovernor = "powersave";

      # Enable Intel Thermal Daemon to manage CPU temperature and prevent overheating
      services.thermald.enable = true;


        # Install graphics drivers for integrated Xe graphics if enabled
        hardware.opengl.extraPackages = mkIf cfg.graphicsSupport [
          pkgs.intel-media-driver    # For VA-API hardware acceleration
          pkgs.intel-compute-runtime # For OpenCL compute support
        ];

        # Optimize package builds for the CPU architecture if enabled
        nixpkgs.localSystem.gcc.arch = mkIf cfg.optimizeBuilds "icelake-client";
        nixpkgs.localSystem.gcc.tune = mkIf cfg.optimizeBuilds "icelake-client";


      };
}
