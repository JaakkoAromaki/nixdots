{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # skriptejä
    btop
    htop
    cmatrix
    fastfetch
    killall
    grim
    hollywood

    # semitärkeit
    bluetui
  ];
}

