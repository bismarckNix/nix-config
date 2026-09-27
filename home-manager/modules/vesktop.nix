{ pkgs, ... }: {
  programs.vesktop = {
    enable = true;
    package = pkgs.vesktop.overrideAttrs (final: prev: {
      nativeBuildInputs = (prev.nativeBuildInputs or []) ++ [ pkgs.makeWrapper ];
      postFixup = (prev.postFixup or "") + ''
        wrapProgram $out/bin/vesktop \
          --add-flags "--disable-features=WebRtcAllowInputVolumeAdjustment"
      '';
    });

    vencord = {
      settings = {
        plugins = {
          AddAttachments.enabled = true;
          AlwaysAnimate.enabled = true;
          BetterFolders.enabled = true;
          CallTimer.enabled = true;
          CrashHandler.enabled = true;
          Decor.enabled = true;
          FakeNitro.enabled = true;
          FakeProfileThemes.enabled = true;
          FixImagesQuality.enabled = true;
          FixYoutubeEmbeds.enabled = true;
          ForceOwnerCrown.enabled = true;
          MessageLogger.enabled = true;
          VolumeBooster.enabled = true;
          WebScreenShareFixes.enabled = true;
          YoutubeAdblock.enabled = true;
        };

        enabledThemes = [ "discord-system24.css" ];
      };

      themes = {
        "NotAnotherAnimeTheme.theme" = builtins.fetchurl {
          url = "https://raw.githubusercontent.com/puckzxz/NotAnotherAnimeTheme/master/NotAnotherAnimeTheme.theme.css";
          sha256 = "sha256-x6Uv78ubu3uYYkZ8glG1ub6wtVLq98Ph1AGbGHpG5qM";
        };
      };
    };
  };
}
