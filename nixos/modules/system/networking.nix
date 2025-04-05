{ config, pkgs, ... }:

{
  networking = {
    hostName = "nixrach";
    networkmanager.enable = true;
  };
}
