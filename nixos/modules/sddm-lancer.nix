{ pkgs, ... }: let
  sddm-lancer = pkgs.stdenvNoCC.mkDerivation {
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
      wayland.enable = false;
      theme = "lancer";
      extraPackages = [
        sddm-lancer
        pkgs.qt6.qtdeclarative
        pkgs.kdePackages.qt5compat
      ];
      settings.General.GreeterEnvironment = "QSG_RHI_BACKEND=opengl";
      settings.General.InputMethod = "";

      setupScript = ''
        ${pkgs.xrdb}/bin/xrdb -merge - <<EOF
        Xcursor.theme: Bibata-Modern-Classic
        Xcursor.size: 24
        EOF
      '';
    };
  };

  environment.systemPackages = [ sddm-lancer ];
}
