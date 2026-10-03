{
  services.fprintd.enable = true;

  security.pam.services = {
    sudo.fprintAuth = true;
    login.fprintAuth = false;
    polkit-1.fprintAuth = true;
    sddm.fprintAuth = false;
  };
}
