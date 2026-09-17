{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    android-tools
    nvtopPackages.nvidia
    universal-android-debloater
    inputs.freesmlauncher.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}