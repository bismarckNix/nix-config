{ config, pkgs, lib, ... }: {
  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    intel-gpu-tools.enable = true;

    graphics = {
      enable = true;
      extraPackages = with pkgs; [ nvidia-vaapi-driver libva-vdpau-driver ];
      enable32Bit = true;
    };

    nvidia = {
      open = true; 
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = false;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
      nvidiaSettings = true;
    };

    i2c.enable = true;
  };
  
  services.xserver.videoDrivers = [ "nvidia" ];
}