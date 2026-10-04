{ config, pkgs, ... }: {
  xdg = {
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-termfilechooser
        pkgs.xdg-desktop-portal-gnome
      ];
      config = {
        niri = {
          default = [ "gnome" "gtk" ];
          "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
        };
      };
    };
    mime = {
      enable = true;
      defaultApplications = {
        "inode/directory" = "yazi.desktop";
        "image/*" = "org.gnome.Loupe.desktop";
        "application/pdf" = "onlyoffice-desktopeditors.desktop";
      };
    };
  };
}
