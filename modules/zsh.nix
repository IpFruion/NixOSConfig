{ lib, config, ... }:

{
  options.zsh = {
     flakeTarget = lib.mkOption {
        description = "flake target for aliases"
     }
  };

  programs.zsh.shellAliases = {
     apply-system = "sudo nixos-rebuild switch --flake ~/NixOSConfig#${config.zsh.flakeTarget}";
  };
}
