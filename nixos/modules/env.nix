{ pkgs, ... }: {
  environment = {
    pathsToLink = [ "/lib/lv2" "/lib/ladspa" "/lib/clap" ];

    variables = {
      LV2_PATH    = "/run/current-system/sw/lib/lv2";
      LADSPA_PATH = "/run/current-system/sw/lib/ladspa";
      CLAP_PATH   = "/run/current-system/sw/lib/clap";
    };

    sessionVariables = {
      TERMINAL = "kitty";
      EDITOR = "nvim";
      GTK_USE_PORTAL = "1";
      NIXOS_OZONE_WL = "1";
      XCURSOR_THEME = "Bibata-Modern-Classic";
      XCURSOR_SIZE = "24";
    };

    systemPackages = [ pkgs.bibata-cursors ];
  };
}
