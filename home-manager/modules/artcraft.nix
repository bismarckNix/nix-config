{ inputs, ... }: {
  imports = [ inputs.artcraft.homeModules.default ];

  programs.artcraft = {
    craft-launcher = {
      enable = true;
    };

    photocraft = {
      enable = true;
      xwayland = true;
      settings = {
        interface.appearanceMode = "dark";
      };
    };

    filmcraft = {
      enable = true;
      settings = {
        appearance.appearanceMode = "dark";
      };
    };
  };
}
