{ config, pkgs, ... }:

{
  # Define primary user
  users.users.sach = {
    isNormalUser = true;
    description = "sach";
    extraGroups = [ "networkmanager" "wheel" "video" ];
  };

  # Optional: Example user configuration
  # users.users.myuser = {
  #   isNormalUser = true;              # Declare as a normal user
  #   group = "myuser";                 # Assign to a custom group
  #   extraGroups = [ "wheel" "audio" ]; # Optional: Add to groups for sudo and sound
  #   home = "/home/myuser";            # Set home directory
  #   createHome = true;                # Automatically create home directory
  #   shell = pkgs.bash;                # Set default shell
  # };

  # Define custom groups
  users.groups.myuser = {};
}
