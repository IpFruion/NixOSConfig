{ lib, config, pkgs, ... }:

{
  options.zsh = {
     flakeTarget = lib.mkOption {
        description = "flake target for aliases";
     };
  };


  home-manager.users."djlock".programs.zsh = {
     enable = true;
     shellAliases = {
       apply-system = "sudo nixos-rebuild switch --flake ~/NixOSConfig#${config.zsh.flakeTarget}";
     };
     autoSuggestions.enable = true;
     syntaxHighlighting.enable = true;
     oh-my-zsh  = {
       enable = true;
       plugins = [ 
	 "web-search"
       ];
       theme = "clean";
     };
  };
}
