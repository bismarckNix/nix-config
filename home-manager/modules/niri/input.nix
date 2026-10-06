{
  xdg.configFile."niri/cfg/input.kdl".text = ''
    input {
      keyboard {
        xkb {
          // Change the keyboard layout options.
          layout "us,ru"
        }
      }

      mouse {
      // Change the pointer speed.
        accel-speed -0.2
      // Comment out this line to enable pointer acceleration.
        accel-profile "flat"
      }

      touchpad {
      // Enable tap-to-click
        tap
      // Enable tap-and-drag
        drag true
      }

      trackpoint {
      // Change the trackpoint speed
        accel-speed 0.2
      // Comment out this line to enable trackpoint acceleration
        accel-profile "flat"
      // Use middle button for scrolling
        scroll-method "on-button-down"
        scroll-button 273
      }
    }
  '';
}
