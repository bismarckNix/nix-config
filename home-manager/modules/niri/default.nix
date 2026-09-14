{ pkgs, ...}: {
  imports = [
    ./general.nix
  ];

  wayland.windowManager.niri = {
    enable = true;
  };
}