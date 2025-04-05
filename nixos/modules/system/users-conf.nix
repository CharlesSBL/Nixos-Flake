{ config, pkgs, ... }:

{
  users.users.sach = {
    isNormalUser = true;
    description = "sach";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  	# Define the user 'myuser'
  	# users.users.myuser = {
    	# 	isNormalUser = true;              # Declare as a normal user
    	# 	group = "myuser";                 # Assign to a custom group
    	# 	extraGroups = [ "wheel" "audio" ]; # Optional: Add to groups for sudo and sound
    	# 	home = "/home/myuser";            # Set home directory
    	# 	createHome = true;                # Automatically create home directory
    	# 	shell = pkgs.bash;                # Set default shell
  	# };

  	# Define the group 'myuser'
  	# users.groups.myuser = {};
}
