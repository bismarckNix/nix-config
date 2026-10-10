{ config, inputs, lib, user, ... }: let
  networks = {
    work_24  = { ssid = "asv-460";         secret = "wifi_work_psk"; };
    work_5g  = { ssid = "asv-460-5";       secret = "wifi_work_psk"; };
    home     = { ssid = "Keenetic-0087";   secret = "wifi_home_psk"; };
  };

  secretNames = lib.unique (lib.mapAttrsToList (_: n: n.secret) networks);
in {
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    age.keyFile = "/var/lib/sops-nix/key.txt";

    secrets = lib.genAttrs secretNames (_: { }) // {
      github_token.owner = user;
    };

    templates = {
      "nm-wifi.env".content = lib.concatMapStringsSep "\n" (s:
        "${lib.toUpper s}=${config.sops.placeholder.${s}}") secretNames;

      "nix-access-tokens" = {
        content = "access-tokens = github.com=${config.sops.placeholder.github_token}";
        owner = user;
      };
    };
  };

  networking.networkmanager.ensureProfiles = {
    environmentFiles = [ config.sops.templates."nm-wifi.env".path ];
    profiles = lib.mapAttrs (_: n: {
      connection = { id = n.ssid; type = "wifi"; permissions = ""; };
      wifi = { mode = "infrastructure"; inherit (n) ssid; };
      wifi-security = {
        key-mgmt = "wpa-psk";
        psk = "$" + lib.toUpper n.secret;
      };
      ipv4.method = "auto";
      ipv6.method = "auto";
    }) networks;
  };

  nix.extraOptions = "!include ${config.sops.templates."nix-access-tokens".path}";
}
