{ config, lib, pkgs, modulesPath, ... }: {

  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" "sdhci_pci" ];
      kernelModules = [ ];
      luks.devices."CRYPTROOT" = {
        device = "/dev/disk/by-uuid/2df2b008-a735-412d-aea6-66e33ea36636";
        allowDiscards = true;
        bypassWorkqueues = true;
      };
    };
    kernelModules = [ ];
    extraModulePackages = [ ];
  };

  fileSystems."/" = {
    device = "/dev/mapper/CRYPTROOT";
    fsType = "ext4";
  };


  fileSystems."/boot" = {
    device = "/dev/disk/by-label/NIXBOOT";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  swapDevices = [ {
    device = "/.swapfile";
    size = 4 * 1024; #MiB
  } ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
