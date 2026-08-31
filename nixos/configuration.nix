{ config, pkgs, lib, inputs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./packages-dev.nix
      ./packages-misc.nix
      ./packages-desktop.nix
      ./packages-apps.nix
      ./packages-wm.nix
      ./packages-shell.nix
    ];

  # bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [
    "video=1920x1080@144"
  ];

  # network
  networking.hostName = "holygrail";
  services.dbus.enable = true;
  networking.wireless.enable = true;
  networking.networkmanager.enable = true;

  # nixsettings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # hardware - bluetooth
  hardware.bluetooth.enable = true;

  # hardware - graphics
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia"];

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
    open = false;
    modesetting.enable = true;
    nvidiaSettings = true;
  };

  # settings - locale
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fi_FI.UTF-8";
    LC_IDENTIFICATION = "fi_FI.UTF-8";
    LC_MEASUREMENT = "fi_FI.UTF-8";
    LC_MONETARY = "fi_FI.UTF-8";
    LC_NAME = "fi_FI.UTF-8";
    LC_NUMERIC = "fi_FI.UTF-8";
    LC_PAPER = "fi_FI.UTF-8";
    LC_TELEPHONE = "fi_FI.UTF-8";
    LC_TIME = "fi_FI.UTF-8";
  };

  # settings - keymap
  services.xserver.xkb = {
    layout = "fi";
    variant = "";
  };

  # settings - console keymap
  console.keyMap = "fi";

  # settings - timezone
  time.timeZone = "Europe/Helsinki";

  # käyttäjä - hamlak
  users.users."hamlak" = {
    isNormalUser = true;
    description = "Hamlak";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };



  programs.steam = {
  	enable = true;
  };

#  programs.spicetify = 
#let
#  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
#in {
# enable = true;
# theme = spicePkgs.themes.text;
#};
  
  security.rtkit.enable = true;
  services.pipewire.enable = true;
  services.pipewire.pulse.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
