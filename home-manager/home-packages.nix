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
    obsidian
    python3
    rustup
    uv
    vlc
    vscodium

    # Utilities
    _7zz-rar
    bc
    bibata-cursors
    brightnessctl
    cacert
    ddcutil
    ffmpeg
    fd
    gcc
    gpu-screen-recorder
    grim
    hyprpicker
    imagemagick
    jq
    kdePackages.qt6ct
    mpvpaper
    pciutils
    poppler
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
    zbar

    # Other
    keepassxc
    pear-desktop
    polkit
    system-config-printer

  ];

  nixpkgs.overlays = [ inputs.xwayland-satellite.overlays.default ];
}
