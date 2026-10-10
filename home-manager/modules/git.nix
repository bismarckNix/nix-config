{ pkgs, ... }: let
  githubCredHelper = pkgs.writeShellScript "git-credential-github-sops" ''
    [ "$1" = get ] || exit 0
    echo "username=x-access-token"
    echo "password=$(cat /run/secrets/github_token)"
  '';
in {
  programs.git = {
    enable = true;

    settings = {
      user = {
        name  = "bismarckNix";
        email = "bismarckNix@proton.me";
      };

      pull.rebase = true;
      rebase.autoStash = true;
      init.defaultBranch = "master";

      credential."https://github.com".helper = "${githubCredHelper}";
    };
  };
}
