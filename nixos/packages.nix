{ inputs, pkgs, ... }: {
  imports = [ inputs.umbriel.nixosModules.default ];

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
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };

    kdeconnect.enable = true;

    niri.enable = true;

    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        glibc
        gcc
      ];
    };

    umbriel.enable = true;

    noctalia ={
      enable = true;
      recommendedServices.enable = true;
    };
  };
}
