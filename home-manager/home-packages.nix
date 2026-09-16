{ inputs, pkgs, ... }: {
  home.packages = with pkgs; [

    # Terminal stuff
    asciiquarium
    btop
    cava
    cmatrix
    lavat
    pipes
    tty-clock
    unimatrix
    inputs.areofyl-fetch.packages.${pkgs.stdenv.hostPlatform.system}.default

    # Files
    (nemo-with-extensions.override {
      extensions = with pkgs; [ nemo-seahorse ];
    })
    udiskie
    xarchiver

    # Browsers
    brave-origin
    tor-browser
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

    # Messengers
    telegram-desktop
    vesktop

    # Work
    gimp
    obsidian
    onlyoffice-desktopeditors
    vlc
    vscodium
    qemu

    # Utilities
    bc
    bibata-cursors
    brightnessctl
    cacert
    cargo
    ddcutil
    ffmpeg
    gpu-screen-recorder
    grim
    hyprpicker
    imagemagick
    jq
    mpv
    mpvpaper
    pciutils
    rustup
    slurp
    sshfs
    translate-shell
    wget
    wl-screenrec
    zbar
    
    # Other
    keepassxc
    pear-desktop
    polkit
    system-config-printer

  ];
}