{ inputs, ... }: {
  imports = [
    inputs.flclash.nixosModules.default
  ];

  programs.flclash = {
    enable = true;
    serviceMode = true;
    tunMode = true;
    autoStart = true;
  };
}
