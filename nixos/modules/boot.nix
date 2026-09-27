{ pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_6_18;

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
     timeout = 0;
    };
  };
}
