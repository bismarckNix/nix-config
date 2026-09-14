{ config, pkgs, ... }: {
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [ nvidia-vaapi-driver libva-vdpau-driver ];
      enable32Bit = true;
    };

    nvidia = {
      open = true; 
      modesetting.enable = true;
      powerManagement.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
      nvidiaSettings = true;
    };

    i2c.enable = true;
  };
  
  services.xserver.videoDrivers = [ "nvidia" ];
}