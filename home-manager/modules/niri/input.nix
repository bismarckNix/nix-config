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
    }
  '';
}
