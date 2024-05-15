{ lib, config, programs, ... }:

{
  options.zsh = {
     flakeTarget = lib.mkOption {
        description = "flake target for aliases";
     };
  };

  config = {
  programs.zsh = {
     enable = true;
     shellAliases = {
       apply-system = "sudo nixos-rebuild switch --flake ~/NixOSConfig#${config.zsh.flakeTarget}";
     };
     autosuggestions.enable = true;
     syntaxHighlighting.enable = true;
     ohMyZsh  = {
       enable = true;
       plugins = [ 
	 "web-search"
       ];
       theme = "clean";
     };
  };
};

}
