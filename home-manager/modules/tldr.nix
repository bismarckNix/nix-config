{ pkgs, ... }: {
  environment.systemPackages = pkgs.tealdeer;

  services.tldr-update = {
    enable = true;
    package = pkgs.tldr;
    period = "weekly";
  };
}
