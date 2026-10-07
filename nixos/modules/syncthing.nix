{ config, pkgs, user, ... }: {
  services.syncthing = {
    enable = true;
    inherit user;
    group = "users";
    dataDir = "/home/${user}";
    configDir = "/home/${user}/.config/syncthing";

    overrideDevices = true;
    overrideFolders = true;
    openDefaultPorts = true;

    settings = {
      urAccepted = -1;
      relaysEnabled = false;
      globalAnnounceEnabled = false;
      localAnnounceEnabled = true;
      natEnabled = false;

      devices = {
        nixos.id = "O7F23NA-DZW7S4Y-3XYKUTR-PU3FSVW-FSSFZMR-YH63SAD-DN33T3I-APHREAJ";
        nix-thinkpad.id = "EWEAMBW-GGBIQBJ-RU5GJG7-R3RMLNZ-XV246DC-NPBLAU3-AB6FRHY-KIHIDAH";
      };

      folders = {
        "vault" = {
          path = "/home/${user}/.synced-vault";
          devices = [ "nixos" "nix-thinkpad" ];
          type = "sendreceive";
          fsWatcherEnabled = true;
            fsWatcherDelayS = 10;
            versioning = {
              type = "staggered";
              params = {
                cleanInterval = "3600";
                maxAge = "15768000";
            };
          };
        };
        "projects" = {
          path = "/home/${user}/Projects";
          devices = [ "nixos" "nix-thinkpad" ];
          type = "sendreceive";
          fsWatcherEnabled = true;
            fsWatcherDelayS = 10;
            versioning = {
              type = "staggered";
              params = {
                cleanInterval = "3600";
                maxAge = "15768000";
            };
          };
        };
      };
    };
  };
}
