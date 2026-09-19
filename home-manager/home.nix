{ homeStateVersion, inputs, user, ... }: {
  imports = [
    ./modules
    ./home-packages.nix
    inputs.umbriel.homeModules.default
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };

  nixpkgs.config.allowUnfree = true;
}
