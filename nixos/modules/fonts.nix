{ config, pkgs, user, ... }: {
  system.activationScripts.onlyofficeFonts = let
    home = config.users.users.${user}.home;
    dest = "${home}/.local/share/fonts/nixos";
  in {
    text = ''
      rm -rf '${dest}'
      install -d -o ${user} -g users '${home}/.local/share/fonts' '${dest}'
      for pkg in ${pkgs.lib.concatMapStringsSep " " (p: "'${p}'") (config.fonts.packages ++ [ pkgs.corefonts ])}; do
        cp -rL --no-preserve=mode,ownership $pkg/share/fonts/* '${dest}/' 2>/dev/null || true
      done
      chown -R ${user}:users '${dest}'
    '';
  };

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      anakron
      corefonts
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
      unifont
      unscii
      vista-fonts
    ];
    fontconfig.defaultFonts = {
      sansSerif = [ "Noto Sans" ];
      serif     = [ "Noto Serif" ];
      monospace = [ "Noto Sans Mono" ];
      emoji     = [ "Noto Color Emoji" ];
    };
  };
}
