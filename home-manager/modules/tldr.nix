{ pkgs, ... }: {
  services.tldr-update = {
    enable = true;
    package = pkgs.tealdeer;
    period = "weekly";
  };
}
