{ config, pkgs, user, ... }: {
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      anakron
      cozette
      dejavu_fonts
      dina-font
      fira-code
      fira-code-symbols
      freefont_ttf
      gyre-fonts
      hack-font
      inter
      liberation_ttf
      nerd-fonts.departure-mono
      nerd-fonts.fira-code
      nerd-fonts.hack
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-color-emoji
      oxygenfonts
      proggyfonts
      roboto
      times-newer-roman
      unifont
      unscii
    ];
    fontconfig.defaultFonts = {
      sansSerif = [ "Noto Sans" ];
      serif     = [ "Noto Serif" ];
      monospace = [ "Noto Sans Mono" ];
      emoji     = [ "Noto Color Emoji" ];
    };
  };
}
