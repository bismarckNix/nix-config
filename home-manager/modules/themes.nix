{
  dconf.settings."org/gnome/desktop/interface"."icon-theme" = "Papirus";
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    qt6ctSettings = {
      Appearance = {
        custom_palette = true;
        color_scheme_path = "$HOME/.config/qt6ct/colors/noctalia.conf";
        icon_theme = "Papirus";
        style = "Breeze";
      };
    };
  };
}
