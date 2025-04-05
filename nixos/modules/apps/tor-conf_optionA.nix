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
  networking.nameservers = [ "127.0.0.1" ];
  networking.firewall = {
    enable = true;  # Ensure the firewall is active
    allowedTCPPorts = [ 9040 9050 9053 ];  # Open Tor-related ports
    extraCommands = ''
      # Flush existing NAT rules to avoid duplicates
      iptables -t nat -F OUTPUT
      # Redirect TCP traffic to Tor's TransPort
      iptables -t nat -A OUTPUT -p tcp -j REDIRECT --to-ports 9040
      # Redirect DNS (UDP 53) to Tor's DNSPort
      iptables -t nat -A OUTPUT -p udp --dport 53 -j REDIRECT --to-ports 9053
    '';
    extraStopCommands = ''
      # Clean up rules on shutdown
      iptables -t nat -F OUTPUT
    '';
  };
}
