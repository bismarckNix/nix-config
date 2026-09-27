{ pkgs, ... }: {
  environment = {
    sessionVariables = {
      TERMINAL = "kitty";
      EDITOR = "nvim";
      LD_LIBRARY_PATH = "/run/opengl-driver/lib";
      GTK_USE_PORTAL = "1";
    };

    systemPackages = [ pkgs.bibata-cursors ];
  };
}
