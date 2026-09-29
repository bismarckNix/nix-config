{ pkgs, ... }: let
  noctalia-modern-minimal-ui-theme = pkgs.stdenvNoCC.mkDerivation rec {
    pname = "noctalia-modern-minimal-ui-theme";
    version = "1.0.0";
    src = ./noctalia-modern-minimal-ui;
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/sounds
      cp -aR $src $out/share/sounds/${pname}
    '';
  }; in {
  home.packages = [ noctalia-modern-minimal-ui-theme ];
}
