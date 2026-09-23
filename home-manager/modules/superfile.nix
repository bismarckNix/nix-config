{ inputs, system, pkgs, user, ... }: {
  programs.superfile = {
    enable = true;
    package = inputs.superfile.packages.${pkgs.system}.superfile;
  };
}

