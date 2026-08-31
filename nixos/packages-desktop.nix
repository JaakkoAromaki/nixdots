{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    eww
    wofi
    pavucontrol
    pulseaudio
    playerctl
  ];
}

