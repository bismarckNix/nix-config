{
  dconf.settings."org/gnome/desktop/interface"."icon-theme" = "Papirus-Dark";
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
    }
    ;
  };
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    qt6ctSettings = {
      Appearance = {
        custom_palette = true;
        color_scheme_path = "$HOME/.config/qt6ct/colors/noctalia.conf";
        icon_theme = "Papirus-Dark";
        style = "Breeze";
      };
    };
  };
}
