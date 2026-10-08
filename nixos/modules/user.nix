{ pkgs, user, ... }: {
  programs.zsh.enable = true;
  security.sudo.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;
    users.${user} = {
      isNormalUser = true;
      extraGroups = [ "audio" "lp" "networkmanager" "video" "wheel" ];
    };
    users.root.hashedPassword = "!";
  };
}
