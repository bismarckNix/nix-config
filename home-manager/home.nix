{ homeStateVersion, inputs, pkgs, lib, user, ... }: {
  imports = [
    ./modules
    ./home-packages.nix
    inputs.umbriel.homeModules.default
    inputs.catppuccin.homeModules.catppuccin
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;

    sessionVariables = {
      LD_LIBRARY_PATH = lib.makeLibraryPath (with pkgs; [
        icu
      ]);
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };
}
