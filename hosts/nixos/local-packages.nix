{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    android-tools
    nvtopPackages.nvidia
    universal-android-debloater
    qemu
  ];
}
