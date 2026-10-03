{ inputs, lib, pkgs, ... }: {
  imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

  boot = {
    kernelPackages = pkgs.linuxPackages_6_18;

    loader.systemd-boot.enable = lib.mkForce false;
    loader.timeout = 0;

    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl/";
    };

    plymouth = {
      enable = true;
      extraConfig = "ShowDelay=0";
    };

    consoleLogLevel = 3;
    initrd = {
      verbose = false;
      systemd.enable = true;
      systemd.services.plymouth-start.after = [ "systemd-modules-load.service" ];
    };
    kernelParams = [
      "quiet"
      "splash"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=auto"
    ];
  };
}
