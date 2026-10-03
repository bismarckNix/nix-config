{ pkgs, ... }: let
  ledSync = pkgs.writeShellScript "led-sync" ''
    set_led() { echo "$2" > "/sys/class/leds/$1/brightness"; }

    update() {
      if ${pkgs.wireplumber}/bin/wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q MUTED
      then set_led platform::micmute 1; else set_led platform::micmute 0; fi

      if ${pkgs.wireplumber}/bin/wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED
      then set_led platform::mute 1; else set_led platform::mute 0; fi
    }

    update
    ${pkgs.pulseaudio}/bin/pactl subscribe | while read -r line; do
      case "$line" in
        *" on sink "*|*" on source "*|*" on server"*) update ;;
      esac
    done
  '';
in {
  services.udev.extraRules = ''
    ACTION=="add|change", SUBSYSTEM=="leds", KERNEL=="platform::*mute", \
      ATTR{trigger}="none", \
      RUN+="${pkgs.coreutils}/bin/chgrp video /sys/class/leds/%k/brightness", \
      RUN+="${pkgs.coreutils}/bin/chmod g+w /sys/class/leds/%k/brightness"
  '';

  systemd.user.services.led-sync = {
    description = "Sync ThinkPad mute LEDs with PipeWire";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    after = [ "pipewire-pulse.service" ];
    serviceConfig = {
      ExecStart = "${ledSync}";
      Restart = "on-failure";
    };
  };
}
