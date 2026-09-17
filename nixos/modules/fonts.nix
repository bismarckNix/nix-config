{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    anakron
    dina-font
    cozette
    proggyfonts
    unscii
    nerd-fonts.hack
    nerd-fonts.departure-mono
  ];
}