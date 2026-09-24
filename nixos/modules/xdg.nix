{
  xdg = {
    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-termfilechooser ];
      config.common."org.freedesktop.impl.portal.FileChooser" = [ "termfilechooser" ];
    };
    mime = {
      enable = true;
      defaultApplications = {
        "inode/directory" = [ "superfile.desktop" ];
        "image/*" = "qimgv.desktop";
      };
    };
  };
}
