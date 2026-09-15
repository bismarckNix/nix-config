{ pkgs, ... }: {
  imports = [
  ./animations.nix
  ./config.nix
  ./general.nix
  ./input.nix
  ./keybinds.nix
  ./layer-rules.nix
  ./layout.nix
  ./output.nix
  ./startup.nix
  ./window-rules.nix
  ];

  wayland.windowManager.niri.enable = true;  
}