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
    settings = {
      arRPC = true;
    };

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
        "NotAnotherAnimeTheme.theme" = ../../css/NotAnotherAnimeTheme.theme.css;
      };
    };
  };
}
