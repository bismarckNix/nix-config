{ pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_6_18;
    kernelParams = [ "nvidia.NVreg_EnableGpuFirmware=0" ];

    initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
     timeout = 0;
    };
  };
}