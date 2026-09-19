{
  xdg.configFile."niri/cfg/window-rules.kdl".text = ''
    window-rule {
      // Rounded corners for a modern look.
      geometry-corner-radius 10

      // Clips window contents to the rounded corner boundaries.
      clip-to-geometry true

      // Draw focus ring around windows
      draw-border-with-background false
    }

    debug {
      // Allows notification actions and window activation from Noctalia.
      honor-xdg-activation-with-invalid-serial
    }

    // ###################################################################################################################
    // App Specific Window Rules
    // ###################################################################################################################

    window-rule {
      // Floating windows
      // Open the Zen picture-in-picture player as floating by default.
      match app-id=r#"zen$"# title="^Picture-in-Picture$"

      open-floating true
    }

    window-rule {
      // Fix the Zen browser transparency
      match app-id=r#"zen$"#
      opacity 0.99999
      background-effect {
        xray true
        blur true
      }

      open-maximized true
    }

    window-rule {
      // Maximized apps
      match app-id="firefox"
      match app-id="zen"
      match app-id="brave-origin"
      match app-id="lazyvim"
      match app-id="codium"
      match app-id="vesktop"
      match app-id="org.telegram.desktop"
      match app-id="ONLYOFFICE"
      match app-id="com.github.th-ch.youtube-music"
      match app-id="steam"

      open-maximized true
    }

    window-rule {
      // Maximized to edges apps
      match app-id="Sober"
      match app-id="Minecraft"

      open-maximized-to-edges true
    }

    window-rule {
      // Window blur
      match app-id="kitty"

      background-effect {
        blur true
      }
    }
  '';
}
