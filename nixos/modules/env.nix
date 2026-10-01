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
      LD_LIBRARY_PATH = [ "/run/opengl-driver/lib" ];
      GTK_USE_PORTAL = "1";
    };

    systemPackages = [ pkgs.bibata-cursors ];
  };
}
