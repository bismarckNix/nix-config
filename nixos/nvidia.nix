{ config, pkgs, lib, ... }: {
  boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];

  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    graphics = {
      enable = true;
      extraPackages = with pkgs; [ nvidia-vaapi-driver ];
      enable32Bit = true;
    };

    nvidia = {
      open = true; 
      modesetting.enable = true;
      powerManagement.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
      nvidiaPersistenced = true;
    };

    i2c.enable = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  systemd.services.nvidia-persistenced.after = [ "systemd-udevd.service" ];
  systemd.services.nvidia-clock-lock = {
    description = "Lock NVIDIA GPU minimum clocks (for smooth animations on WMs)";
    wantedBy = [ "multi-user.target" ];
    after = [ "nvidia-persistenced.service" ];
    requires = [ "nvidia-persistenced.service" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = [
        "${config.hardware.nvidia.package.bin}/bin/nvidia-smi -lgc 1200,999999"
        "${config.hardware.nvidia.package.bin}/bin/nvidia-smi -lmc 7001,999999"
      ];
    RemainAfterExit = true;
    };
  };

  powerManagement.cpuFreqGovernor = "performance";
}
