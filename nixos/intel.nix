{ pkgs, ... }: {
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vpl-gpu-rt
      intel-compute-runtime
    ];
    enable32Bit = true;
    extraPackages32 = with pkgs.pkgsi686Linux; [ intel-media-driver ];
  };

  environment.sessionVariables.LIBVA_DRIVER_NAME = "iHD";

  services.thermald.enable = true;
  powerManagement.powertop.enable = true;

  boot.initrd.kernelModules = [ "i915" ];
}
