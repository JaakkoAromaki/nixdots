# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.spicetify-nix.nixosModules.default
  # For home-manager
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "holygrail"; # Define your hostname.
  services.dbus.enable = true;

  	
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Helsinki";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  hardware.bluetooth.enable = true;

  # Select internationalisation properties.
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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fi";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "fi";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."hamlak" = {
    isNormalUser = true;
    description = "Hamlak";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
    # Install zsh
  programs.zsh = {
    enable = true;
     shellAliases = {
    	ll = "ls -l";
    	edit = "sudo -e";
    	update = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
	rebuild = "sudo nixos-rebuild switch";	
	cl = "clear";
	penis = "echo penis \n echo hihi :3";
	dihh = "echo 'i want a dih in my ass'";
	dihcord = "vesktop";
    };
    enableBashCompletion = true;
    autosuggestions.enable = true;

    syntaxHighlighting.enable = false;
    syntaxHighlighting.styles = { 
    	"alias" = "fg=magenta,bold"; 
    	"command" = "fg=magneta,bold";
    };
    autosuggestions.highlightStyle = "fg=22";
  };

  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "git" ];
    custom = "$HOME/.oh-my-zsh/custom/";
    theme = "powerlevel10k/powerlevel10k";
  };

  programs.steam = {
  	enable = true;
  };

  programs.spicetify = 
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  enable = true;
  theme = spicePkgs.themes.text;
};
  
  security.rtkit.enable = true;
  services.pipewire.enable = true;
  services.pipewire.pulse.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  neovim
  wayfire
  wget
  kitty
  firefox
  wofi
  git
  fastfetch
  grim
  vscode
  curl
  discord
  bluetui
  vesktop
  killall
  python3
  spotify
  pavucontrol
  pulseaudio
  nodejs_22
  playerctl
  linux-wallpaperengine
  htop
  btop
  eww
  ];

  programs.wayfire = {
	enable = true;
	plugins = with pkgs.wayfirePlugins; [
		wcm
		wf-shell
		wayfire-plugins-extra
  	];
  }; 

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

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
