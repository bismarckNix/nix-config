{ inputs, pkgs, ... }: {
  home.packages = with pkgs; [

    # Terminal stuff
    asciiquarium
    btop
    cava
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
    telegram-desktop
    (pkgs.symlinkJoin {
      name = "vesktop";
      paths = [ pkgs.vesktop ];
      nativeBuildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/vesktop \
          --add-flags "--disable-features=WebRtcAllowInputVolumeAdjustment"
      '';
    })

    # Work
    gimp
    obsidian
    onlyoffice-desktopeditors
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
    fzf
    gcc
    gpu-screen-recorder
    grim
    hyprpicker
    imagemagick
    jq
    mpv
    mpvpaper
    pciutils
    poppler
    qimgv
    resvg
    ripgrep
    slurp
    sshfs
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
}
