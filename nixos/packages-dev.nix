{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
   # apps
   neovim
   git
   curl
   wget
   vscodium

   # langs
   python3
   nodejs_22
  ];
}

