{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.hardware.cpu.intel.gen11;
in

{
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

    config = mkIf cfg.enable {
      boot.kernelModules = ["kvm-intel"];
      hardware.cpu.intel.updateMicrocode = true;
      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

      # powerManagement.cpuFreqGovernor = "performance";

      services.thermald.enable = true;

        hardware.opengl.extraPackages = mkIf cfg.graphicsSupport [
          pkgs.intel-media-driver    # For VA-API hardware acceleration
          pkgs.intel-compute-runtime # For OpenCL compute support
        ];

        nixpkgs.localSystem.gcc.arch = mkIf cfg.optimizeBuilds "icelake-client";
        nixpkgs.localSystem.gcc.tune = mkIf cfg.optimizeBuilds "icelake-client";
      };
}
