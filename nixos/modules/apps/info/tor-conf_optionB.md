```nix


{ config, pkgs, ... }:
{
  services.tor = {
    enable = true;
    client.enable = true;
    settings = {
      VirtualAddrNetworkIPv4 = "10.192.0.0/10";
      VirtualAddrNetworkIPv6 = "fc00::/7";
      AutomapHostsOnResolve = true;
      TransPort = [ 9040 ];  # Port number only
      DNSPort = [ 9053 ];   # Port number only
    };
  };

  networking.firewall = {
    enable = true;
    extraCommands = ''
      # Flush existing rules
      iptables -F
      iptables -t nat -F
      ip6tables -F
      ip6tables -t nat -F

      # Allow loopback
      iptables -A OUTPUT -o lo -j ACCEPT
      ip6tables -A OUTPUT -o lo -j ACCEPT

      # Allow Tor process to connect to the internet (exclude from redirection)
      iptables -t nat -A OUTPUT -p tcp -m owner --uid-owner tor -j ACCEPT
      iptables -A OUTPUT -p tcp -m owner --uid-owner tor -j ACCEPT
      ip6tables -t nat -A OUTPUT -p tcp -m owner --uid-owner tor -j ACCEPT
      ip6tables -A OUTPUT -p tcp -m owner --uid-owner tor -j ACCEPT

      # Redirect non-Tor TCP traffic to TransPort
      iptables -t nat -A OUTPUT -p tcp -j REDIRECT --to-ports 9040
      ip6tables -t nat -A OUTPUT -p tcp -j REDIRECT --to-ports 9040

      # Redirect DNS to DNSPort
      iptables -t nat -A OUTPUT -p udp --dport 53 -j REDIRECT --to-ports 9053
      iptables -t nat -A OUTPUT -p tcp --dport 53 -j REDIRECT --to-ports 9053
      ip6tables -t nat -A OUTPUT -p udp --dport 53 -j REDIRECT --to-ports 9053
      ip6tables -t nat -A OUTPUT -p tcp --dport 53 -j REDIRECT --to-ports 9053

      # Allow established/related traffic
      iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
      ip6tables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

      # Block all other traffic
      iptables -P OUTPUT DROP
      ip6tables -P OUTPUT DROP
    '';
  };

  networking.nameservers = [ "127.0.0.1" "::1" ];
}

```