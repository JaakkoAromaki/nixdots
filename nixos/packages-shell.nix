{ pkgs, ... }: {
  programs.zsh = {
     enable = true;
     shellAliases = {
          # utils
    	  ll = "ls -l";
    	  edit = "sudo -e";
    	  update = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
	  rebuild = "sudo nixos-rebuild switch";	
	  cl = "clear";

	  #misc
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
}
