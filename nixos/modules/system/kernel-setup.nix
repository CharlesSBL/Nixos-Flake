{ config, pkgs, ... }:

{		
  	boot.kernelPackages = pkgs.linuxKernel.packages.linux_5_15;

	# boot.kernelPatches = [
    # 	{
    # 		name = "Rust Support";
    # 		patch = null;
    # 		features = {
	# 			rust = true;
    # 		};
	# 	}
  	# ];
}
