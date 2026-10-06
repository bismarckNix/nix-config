{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name  = "bismarckNix";
        email = "bismarckNix@proton.me";
      };

      pull.rebase = true;
      rebase.autoStash = true;
    };
  };
}
