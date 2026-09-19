{ inputs, pkgs, ... }: {
  programs.nixvim = {
    enable = true;
    extraPlugins = with pkgs.vimPlugins; [
      LazyVim
      vim-nix
    ];
  };
}