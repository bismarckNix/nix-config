{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    colors = "auto";
    git = true;
    icons = "auto";
    extraOptions = [
      "--group-directories-first"
      "--header"
    ];
  };
}
