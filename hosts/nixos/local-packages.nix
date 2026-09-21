{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    android-tools
    nvtopPackages.nvidia
    kdePackages.kdenlive
    universal-android-debloater
    qemu
    inputs.freesmlauncher.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
