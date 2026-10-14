{ inputs, ... }: {
  imports = [ inputs.artcraft.homeModules.default ];

  programs.artcraft = {
    fullSuite.enable = true;

    photocraft = {
      xwayland = true;
      settings = {
        interface.appearanceMode = "dark";
      };
    };

    filmcraft = {
      settings = {
        appearance.appearanceMode = "dark";
      };
    };
  };
}
