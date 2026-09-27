{ config, pkgs, user, ... }: {
  system.activationScripts.onlyofficeFonts = {
    text = ''
      mkdir -p ${config.users.users.${user}.home}/.local/share/fonts
      for pkg in ${pkgs.lib.concatMapStringsSep " " (p: "'${p}'") (config.fonts.packages ++ [ pkgs.corefonts ])}; do
        cp -rn $pkg/share/fonts/* ${config.users.users.${user}.home}/.local/share/fonts/ 2>/dev/null || true
      done
      find ${config.users.users.${user}.home}/.local/share/fonts -type d -exec chmod 755 {} \;
      find ${config.users.users.${user}.home}/.local/share/fonts -type f -exec chmod 644 {} \;
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
      nerd-fonts.hack
      nerd-fonts.departure-mono
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
