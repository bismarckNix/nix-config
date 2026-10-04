{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    android-tools
    nvtopPackages.nvidia
    kdePackages.kdenlive
    universal-android-debloater
    qemu
  ];
}
