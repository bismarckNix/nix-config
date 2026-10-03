{ pkgs, stateVersion, hostname, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./local-packages.nix
    ../../nixos/lanzaboote.nix
    ../../nixos/packages.nix
    ../../nixos/modules
    ../../nixos/intel.nix
    ../../nixos/fingerprint.nix
    ../../nixos/thinkpad-leds.nix
  ];

  environment.systemPackages = [ pkgs.home-manager ];

  networking.hostName = hostname;

  system.stateVersion = stateVersion;
}
