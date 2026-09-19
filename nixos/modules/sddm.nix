{ pkgs, ... }: let
  theme = pkgs.stdenvNoCC.mkDerivation {
    pname = "lancer";
    version = "2.0.0";
    src = ../lancer;
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src $out/share/sddm/themes/lancer
    '';
  };
in
{
  services.displayManager = {
    defaultSession = "niri";
    sddm = {
      enable = true;
      package = pkgs.kdePackages.sddm;
      theme = "lancer";
      extraPackages = [ theme ];
      settings.General.GreeterEnvironment = "QT_QUICK_CONTROLS_STYLE=Fusion";
      setupScript = ''
        ${pkgs.xrdb}/bin//xrdb - merge - <<EOF
        Xcursor.theme: Bibata-Modern-Classic
        Xcursor.size: 24
        EOF
      '';
    };
  };
}
