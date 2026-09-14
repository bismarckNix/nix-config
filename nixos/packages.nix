{ inputs, pkgs, ... }: {
  imports = [ inputs.umbriel.nixosModules.default ];

  programs = {
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

    umbriel.enable = true;
    noctalia ={
      enable = true;
      recommendedServices.enable = true;
    };
  };
}