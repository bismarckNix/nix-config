{ inputs, pkgs, ... }: {
  imports = [ inputs.umbriel.nixosModules.default ];
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  programs = {
    niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };

    umbriel.enable = true;

    noctalia ={
      enable = true;
      recommendedServices.enable = true;
    };
  };
}
