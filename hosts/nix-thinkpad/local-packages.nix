{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nvtopPackages.intel
    powertop
  ];
}
