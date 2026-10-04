{ pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_6_18;

    loader.timeout = 0;

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

