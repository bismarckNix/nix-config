{
  xdg.configFile."niri/cfg/general.kdl".text = ''
    // Comment out this line to enable the important hotkeys pop-up at startup.
    hotkey-overlay {
      skip-at-startup
    }

    // Comment out this line to enable client-side decorations.
    prefer-no-csd

    // Customize the screenshot directory.
    screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"

    // Set the cursor theme
    cursor {
      xcursor-theme "Bibata-Modern-Classic"
      xcursor-size 24
    }

    // Fix cursor jittering bug.
    debug {
      disable-cursor-plane
    }
  '';
}