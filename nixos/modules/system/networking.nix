{ config, pkgs, ... }:

{
  networking.hostName = "nixrach";
  networking.networkmanager.enable = true;
}
