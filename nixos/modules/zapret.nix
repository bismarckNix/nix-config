{ lib, ... }: let
  youtube    = [ "youtube.com" "youtu.be" "googlevideo.com" "ytimg.com" "ggpht.com"
                 "youtubei.googleapis.com" "googleusercontent.com" "youtube-nocookie.com" ];
  soundcloud = [ "soundcloud.com" "sndcdn.com" ];
  github     = [ "github.com" "githubusercontent.com" "githubassets.com" "github.io" "githubapp.com" ];
  discord    = [ "discord.com" "discord.gg" "discordapp.com" "discordapp.net"
                 "discord.media" "discordcdn.com" "discordstatic.com" "discord.gift" ];

  tcpHosts = lib.concatStringsSep "," (youtube ++ soundcloud ++ github ++ discord);

  nfq = "-m connbytes --connbytes-dir=original --connbytes-mode=packets --connbytes 1:6 "
      + "-m mark ! --mark 0x40000000/0x40000000 -j NFQUEUE --queue-num 200 --queue-bypass";

  rules = [
    "-p tcp --dport 443 ${nfq}"
    "-p udp --dport 50000:50100 ${nfq}"   # Discord voice
  ]; in {
  services.zapret = {
    enable = true;
    configureFirewall = false;  # we add the iptables rules ourselves below
    params = [
      # YouTube, YouTube Music, SoundCloud, GitHub, Discord (TCP 443)
      "--filter-tcp=443"
      "--hostlist-domains=${tcpHosts}"
      "--dpi-desync=fake,multidisorder"
      "--dpi-desync-ttl=4"
      "--new"

      # Discord voice (UDP)
      "--filter-udp=50000-50100"
      "--filter-l7=discord,stun"
      "--dpi-desync=fake"
      "--dpi-desync-repeats=6"
    ];
  };

  networking.firewall.extraCommands = lib.concatMapStringsSep "\n" (r: ''
    iptables -t mangle -C POSTROUTING ! -o lo ${r} 2>/dev/null \
      || iptables -t mangle -A POSTROUTING ! -o lo ${r}
  '') rules + ''

    iptables -C OUTPUT -p udp --dport 443 -j REJECT 2>/dev/null \
      || iptables -A OUTPUT -p udp --dport 443 -j REJECT
  '';

  networking.firewall.extraStopCommands = lib.concatMapStringsSep "\n" (r: ''
    iptables -t mangle -D POSTROUTING ! -o lo ${r} 2>/dev/null || true
  '') rules + ''

    iptables -D OUTPUT -p udp --dport 443 -j REJECT 2>/dev/null || true
  '';
}
