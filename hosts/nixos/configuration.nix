{ pkgs, stateVersion, hostname, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./local-packages.nix
    ../../nixos/systemd-boot.nix
    ../../nixos/packages.nix
    ../../nixos/nvidia.nix
    ../../nixos/modules
  ];

  environment.systemPackages = [ pkgs.home-manager ];

  networking.hostName = hostname;

  system.stateVersion = stateVersion;
}
