{ inputs, ... }: {
  imports = [ inputs.umbriel.nixosModules.default ];

  programs = {
    niri.enable = true;

    umbriel.enable = true;

    noctalia ={
      enable = true;
      recommendedServices.enable = true;
    };
  };
}
