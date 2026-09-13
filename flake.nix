{
  description = "My NixOS configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Packages
    areofyl-fetch.url = "github:areofyl/fetch";

    freesmlauncher.url = "github:FreesmTeam/FreesmLauncher";

    umbriel.url = "git+https://github.com/noctalia-dev/umbriel";

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: let
  system = "x86_64-linux";
  homeStateVersion = "26.05";
  user = "bismarck";
  hosts = [
    { hostname = "nixos"; stateVersion = "26.05"; }
  ];

  makeSystem = { hostname, stateVersion }: nixpkgs.lib.nixosSystem {
    system = system;
    specialArgs = {
      inherit inputs stateVersion hostname user;
    };

    modules = [
      ./hosts/${hostname}/configuration.nix
      home-manager.nixosModules.home-manager
    ];
  };

  in {
    nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
      configs // {
        "${host.hostname}" = makeSystem {
          inherit (host) hostname stateVersion;
        };
      }) {} hosts;

    homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      extraSpecialArgs = {
        inherit inputs homeStateVersion user;
      };

      modules = [
        ./home-manager/home.nix
      ];
    };
  };
}