{ config, pkgs, ... }: {
  dconf.settings."org/gnome/desktop/interface" = {
    "icon-theme" = "Papirus-Dark";
    "color-scheme" = "prefer-dark";
  };
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk3.extraCss = ''
      @import url("file://${config.xdg.configHome}/gtk-3.0/nemo-theme.css");
    '';
    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.extraCss = builtins.readFile ../../css/gtk4-catppuccin-macchiato.css;
  };
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.package = pkgs.adwaita-qt6;
    qt6ctSettings = {
      Appearance = {
        custom_palette = true;
        color_scheme_path = "$HOME/.config/qt6ct/colors/noctalia.conf";
        icon_theme = "Papirus-Dark";
        style = "Adwaita-dark";
      };
    };
  };

  xdg.configFile."gtk-3.0/nemo-theme.css".source = ../../css/nemo-catppuccin-macchiato.css;

  home.pointerCursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
}
