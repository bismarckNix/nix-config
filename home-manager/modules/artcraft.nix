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

    wordcraft = {
      uiSettings = {
        theme = "dark";
        window.monitor = [
          "1280.0"
          "720.0"
        ];
      };
    };

    deckcraft = {
      uiSettings = {
        brightness = "dark";
      };
    };

    gridcraft = {
      uiSettings = {
        dark = true;
      };
    };
  };
}
