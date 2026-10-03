{ pkgs, user, ... }: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;
    users.${user} = {
      isNormalUser = true;
      extraGroups = [ "audio" "video" "wheel" "networkmanager" "lp" ];
    };
    users.root.hashedPassword = "!";
  };
}
