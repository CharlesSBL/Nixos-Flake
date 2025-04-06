```nix

{ config, pkgs, ... }:
{
  services.tor = {
    enable = true;
    client.enable = true;
    settings = {
      VirtualAddrNetworkIPv4 = "10.192.0.0/10";
      AutomapHostsOnResolve = true;
      TransPort = [ 9040 ];
      DNSPort = [ 9053 ];
    };
  };

  # Disable IPv6 to prevent leaks
  networking.enableIPv6 = false;

  networking.firewall = {
    enable = true;
    extraCommands = ''
      # Flush existing rules
      iptables -F
      iptables -t nat -F
      
      # Set default OUTPUT policy to DROP (prevent leaks)
      iptables -P OUTPUT DROP

      # Allow loopback
      iptables -A OUTPUT -o lo -j ACCEPT

      # Allow Tor process to connect to the internet (exclude from redirection)
      iptables -t nat -A OUTPUT -p tcp -m owner --uid-owner tor -j ACCEPT
      iptables -A OUTPUT -m owner --uid-owner tor -j ACCEPT

      # Redirect DNS to DNSPort
      iptables -t nat -A OUTPUT -p udp --dport 53 -j REDIRECT --to-ports 9053
      iptables -t nat -A OUTPUT -p tcp --dport 53 -j REDIRECT --to-ports 9053

      # Redirect TCP traffic to TransPort
      iptables -t nat -A OUTPUT -p tcp -j REDIRECT --to-ports 9040

      # Allow established/related traffic (for return packets)
      iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
    '';
    extraStopCommands = ''
      # Reset default policy when stopping firewall
      iptables -P OUTPUT ACCEPT
    '';
  };

  # Force DNS through Tor
  networking.nameservers = [ "127.0.0.1" ];
  
  # Prevent DNS leaks
  networking.resolvconf.enable = false;
  environment.etc."resolv.conf".text = "nameserver 127.0.0.1";
}

```