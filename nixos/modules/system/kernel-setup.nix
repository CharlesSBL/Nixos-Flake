{ config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackagesFor (pkgs.linuxKernel.kernels.linux_5_15.override {
    argsOverride = rec {
      src = pkgs.fetchurl {
        url = "mirror://kernel/linux/kernel/v5.x/linux-5.15.179.tar.xz";
        # sha256 = pkgs.lib.fakeSha256;# Placeholder; to understand which sha256
	      sha256 = "kxmkex6bXTRP9gFUMYVtDJZA5PrtxSfIf5EpBhonE28="; # Updated hash
      };
      version = "5.15.179";
      modDirVersion = "5.15.179";
    };
  });
}
