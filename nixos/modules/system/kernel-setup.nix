{ config, pkgs, ... }:

{
  # Use Linux 5.10 LTS kernel for stability and compatibility with 11th Gen Intel CPUs
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_5_15;

  # Configure kernel parameters for Intel iGPU power optimization
  boot.kernelParams = [
    "i915.enable_psr=1"    # Panel Self Refresh for display power saving
    "i915.enable_rc6=7"    # Deepest GPU power-saving state
    "i915.enable_guc=2"    # Enable GuC + HuC for better power management and video acceleration
  ];

  # Enable auto-cpufreq for dynamic governor adjustment based on power source
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";  # Power saving on battery
    };
    charger = {
      governor = "performance";  # Maximum performance when plugged in
    };
  };

  # boot.kernelPatches = [ { name = "Rust Support"; patch = null; features = { rust = true; }; } ];
}
