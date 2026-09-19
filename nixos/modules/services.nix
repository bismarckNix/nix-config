{ pkgs, ... }:
let
  hplipPatched = pkgs.hplip.overrideAttrs (old: {
    postInstall = (old.postInstall or "") + ''
      sed -i 's/URLopener/OpenerDirector/g' $out/share/hplip/base/device.py
      sed -i 's/\.getcode()/.status()/g' $out/share/hplip/base/device.py
    '';
  });
in
{  
  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    
    desktopManager.plasma6.enable = true;

    flatpak.enable = true;
    gvfs.enable = true;

    gnome.gnome-keyring.enable = true;

    libinput = {
      enable = true;
      mouse = {
        accelProfile = "flat";
        accelSpeed = "-0.4";
      };
    };
    
    printing = {
      enable = true;
      drivers = [ pkgs.hplipWithPlugin ];
    };

    xserver.enable = true;
  };

  environment.systemPackages = [ hplipPatched ];
}
