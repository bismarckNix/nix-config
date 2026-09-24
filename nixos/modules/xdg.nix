{ config, pkgs, ... }: {
  xdg = {
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-termfilechooser
        pkgs.xdg-desktop-portal-gnome
      ];
      config = {
        niri."org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
      };
    };
    mime = {
      enable = true;
      defaultApplications = {
        "inode/directory" = "superfile.desktop";
        "image/*" = "qimgv.desktop";
      };
    };
  };
}
