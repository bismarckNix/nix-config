{ config, pkgs, user, ... }: {
  services.syncthing = {
    enable = true;
    inherit user;
    group = "users";
    dataDir = "/home/${user}";
    configDir = "/home/${user}/.config/syncthing";

    overrideDevices = true;
    overrideFolders = true;

    settings = {
      urAccepted = -1;
      relaysEnabled = false;
      globalAnnounceEnabled = false;
      localAnnounceEnabled = true;
      natEnabled = false;

      folders = {
        "vault" = {
          path = "/home/${user}/.synced-vault";
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
