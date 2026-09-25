{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      show_startup_tips = false;
      pane_frames = false;
      on_force_close = "quit";
    };
  };
}
