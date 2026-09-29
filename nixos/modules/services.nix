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

    power-profiles-daemon.enable = true;

    printing = {
      enable = true;
      drivers = [ pkgs.hplipWithPlugin ];
    };

    upower.enable = true;

    xserver = {
      enable = true;
      excludePackages = with pkgs; [ xterm ];
    };
  };

  systemd.services.avahi-daemon.serviceConfig.ExecStartPre = "+/run/current-system/sw/bin/rm -f /run/avahi-daemon/pid";

  environment.systemPackages = [ hplipPatched ];
}
