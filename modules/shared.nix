{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # User Settings
  networking.hostname = "djlock";

  users.users.djlock = {
    hashedPassword = "$6$1YKQdSAE1aYdzE1Y$rowV9zeuWt2h9u9R0AkDReo1/wOFyTLnzUFvjxfdXj04VuvR5haHsX4aBiCtFufwoy7HIQMDiiIVgiLt5gOW1/";
    isNormalUser = true;
    description = "Derrick Lockwood";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "djlock" = import ./home.nix
    };
  };

  programs.firefox.enable = true;
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    home-manager
    git
    gh
    neovim
    tmux
  ];
}
