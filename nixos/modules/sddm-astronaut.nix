{ pkgs, ... }: let
  sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "hyprland_kath";  # or any other theme
  };
in
{
  environment.systemPackages = [ sddm-astronaut ];

  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    extraPackages = with pkgs; [
      kdePackages.qtmultimedia # Required for video backgrounds/audio
    ];
    theme = "sddm-astronaut-theme";
    setupScript = ''
      ${pkgs.xrdb}/bin/xrdb -merge - <<EOF
      Xcursor.theme: Bibata-Modern-Classic
      Xcursor.size: 24
      EOF
    '';
  };
}
