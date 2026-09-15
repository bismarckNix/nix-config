{
  xdg.configFile."niri/cfg/output.kdl".text = ''
    output "DP-1" {

      // Resolution and, optionally, refresh rate of the output.
      mode "1920x1080@164.917"
      // Scale of the monitor.
      scale 1

      // Screen rotation (valid inputs: normal, 90, 180, 270, flipped, flipped-90, flipped-180 and flipped-270).
      transform "normal"

      // Position of the output in the global coordinate space.
      // Changing this might break mouse input in some apps.
      position x=0 y=0

    }
  '';
}
