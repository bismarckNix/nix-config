{ lib, ... }:
let
  domains = [
    # YouTube / YouTube Music
    "youtube.com" "youtu.be" "googlevideo.com" "ytimg.com" "ggpht.com"
    "youtubei.googleapis.com" "googleusercontent.com" "youtube-nocookie.com"
    # SoundCloud
    "soundcloud.com" "sndcdn.com"
    # GitHub
    "github.com" "githubusercontent.com" "githubassets.com" "github.io" "githubapp.com"
    # Discord
    "discord.com" "discord.gg" "discordapp.com" "discordapp.net"
    "discord.media" "discordcdn.com" "discordstatic.com" "discord.gift"
  ];
in
{
  services.zapret = {
    enable = true;
    udpSupport = true;
    udpPorts = [ "50000:50100" ];
    params = [
      "--filter-tcp=443"
      "--hostlist-domains=${lib.concatStringsSep "," domains}"
      "--dpi-desync=fake,multidisorder"
      "--dpi-desync-split-pos=1,midsld"
      "--dpi-desync-fooling=badseq,md5sig"
      "--new"
      "--filter-udp=50000-50100"
      "--filter-l7=discord,stun"
      "--dpi-desync=fake"
      "--dpi-desync-repeats=6"
    ];
  };
}
