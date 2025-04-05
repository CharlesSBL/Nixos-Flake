{ config, pkgs, ... }:
{
  services.tor = {
    enable = true;
    settings = {
      VirtualAddrNetworkIPv4 = "10.192.0.0/10";
      AutomapHostsOnResolve = true;
      TransPort = 9040;
      DNSPort = 9053;
    };
  };
  networking.firewall.extraCommands = ''
    iptables -t nat -A OUTPUT -p tcp -j REDIRECT --to-ports 9040
    iptables -t nat -A OUTPUT -p udp --dport 53 -j REDIRECT --to-ports 9053
  '';
  networking.nameservers = [ "127.0.0.1" ];
}
