{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nvtopPackages.nvidia
    universal-android-debloater
    qemu
  ];
}
