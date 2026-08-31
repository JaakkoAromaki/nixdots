{ pkgs, inputs, ... }:

  let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in
  {
    environment.systemPackages = with pkgs; [
      kitty
      firefox
      discord
      vesktop
      steam
    ];

    programs.spicetify = {
      enable = true;
      theme = spicePkgs.themes.text;
  };
}

