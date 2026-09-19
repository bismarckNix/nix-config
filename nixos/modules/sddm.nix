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
      wayland.enable = false;
      theme = "lancer";
      extraPackages = [
        theme
        pkgs.qt6.qtdeclarative
        pkgs.kdePackages.qt5compat
      ];
      settings.General.GreeterEnvironment = "QSG_RHI_BACKEND=opengl QT_WAYLAND_DISABLE_DPI_SCALING=1";
      settings.General.InputMethod = "";
    };
  };

  environment.systemPackages = [ theme ];
}
