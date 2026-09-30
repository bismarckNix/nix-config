{ inputs, pkgs, ... }: {
  home.packages = with pkgs; [

    # Terminal stuff
    asciiquarium
    cmatrix
    lavat
    microfetch
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
    discordo
    telegram-desktop

    # Work
    gimp
    libreoffice
    obsidian
    python3
    rustup
    uv
    vlc
    vscodium

    # Utilities
    _7zz-rar
    bc
    brightnessctl
    cacert
    ddcutil
    ffmpeg
    fd
    gcc
    ghgrab
    gpu-screen-recorder
    grim
    hyprpicker
    imagemagick
    jq
    kdePackages.qt6ct
    mpvpaper
    pastel
    pciutils
    poppler-utils
    qimgv
    resvg
    ripgrep
    slurp
    sshfs
    tealdeer
    translate-shell
    wget
    wl-clipboard
    wl-screenrec
    xwayland-satellite
    zbar

    # Other
    kdePackages.breeze
    keepassxc
    pear-desktop
    papirus-icon-theme
    polkit
    smassh
    system-config-printer

  ];
}
