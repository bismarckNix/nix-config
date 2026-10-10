{ inputs, options, pkgs, ... }: {
  programs = {
    appimage = {
      enable = true;
      binfmt = true;
    };

    clash-verge = {
      enable = true;
      serviceMode = true;
      tunMode = true;
      autoStart = true;
    };

    steam = {
      enable = true;
      package = pkgs.millennium-steam;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };

    kdeconnect.enable = true;

    nix-ld = {
      enable = true;
      libraries = options.programs.nix-ld.libraries.default ++ [ pkgs.libGL ];
    };
  };

  nixpkgs.overlays = [ inputs.millennium.overlays.default ];
}
