{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    anakron
    dina-font
    cozette
    proggyfonts
    unscii
    fira-code
    fira-code-symbols
    nerd-fonts.hack
    nerd-fonts.departure-mono
    nerd-fonts.jetbrains-mono
  ];
}
