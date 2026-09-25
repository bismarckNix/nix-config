{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      default_mode = "locked";
      show_startup_tips = false;
      pane_frames = false;
      on_force_close = "quit";
    };
  };
}
