{
  xdg.configFile."niri/cfg/layout.kdl".text = ''
    layout {

      // Set gaps around windows in logical pixels.
      gaps 16

      center-focused-column "never"

      // Customize the widths that "switch-preset-column-width" (Mod+R) toggles between.
      preset-column-widths {
          proportion 0.33333
          proportion 0.5
          proportion 0.66667
      }

      // Customize the default width of the new windows.
      default-column-width { proportion 0.5; }

      // You can change how the focus ring looks.
      focus-ring {

        // How many logical pixels the ring extends out from the windows.
        width 4

        // Gradient of the ring.
        // Coffee:
        // active-gradient from="#ffb3ad" to="#e1c28c" angle=45
        // Purple:
        // active-gradient from="#a15fe2" to="#9358ce" angle=45
      }

      border {
        off
      }

      // Customize drop shadows for windows.
      shadow {
        on

        // Softness controls the shadow blur radius.
        softness 30

        // Spread expands the shadow.
        spread 5

        // Offset moves the shadow relative to the window.
        offset x=0 y=5

        // You can also change the shadow color and opacity.
        // color "#0007"
      }
    }
  '';
}
