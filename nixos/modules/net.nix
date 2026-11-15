{
  networking = {
    networkmanager = {
      enable = true;
      wifi.macAddress = "random";
    };

    firewall = {
      enable = true;
    };

    hosts = {
      "18.65.39.105" = [ "tr.rbxcdn.com" ];
    };
  };
}
