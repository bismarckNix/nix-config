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
      nvidiaPersistenced = true;
    };

    i2c.enable = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  systemd.services.nvidia-persistenced.after = [ "systemd-udevd.service" ];
  systemd.services.nvidia-clock-lock = {
    description = "Lock NVIDIA GPU minimum clocks";
    wantedBy = [ "multi-user.target" ];
    after = [ "nvidia-persistenced.service" ];
    requires = [ "nvidia-persistenced.service" ];
    path = [ config.hardware.nvidia.package.bin ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = [
        "${config.hardware.nvidia.package.bin}/bin/nvidia-smi -lgc 210,999999"
        "${config.hardware.nvidia.package.bin}/bin/nvidia-smi -lmc 405,999999"
      ];
    RemainAfterExit = true;
    };
  };
}
