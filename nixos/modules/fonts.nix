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

  fonts.packages = with pkgs; [
    anakron
    corefonts
    cozette
    dina-font
    fira-code
    fira-code-symbols
    nerd-fonts.hack
    nerd-fonts.departure-mono
    nerd-fonts.jetbrains-mono
    proggyfonts
    unscii
    vista-fonts
  ];
}
