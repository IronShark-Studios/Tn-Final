# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./Home-Packages/home-manager.nix
    ./Home-Packages/Emacs/emacs.nix
    ./Home-Packages/alacritty.nix
    ./Home-Packages/firefox.nix
    ./Home-Packages/bash.nix
    ./Home-Packages/git.nix
    ./Home-Packages/polybar.nix
  ];

  home = {
    username = "xin";
    homeDirectory = "/home/xin";
    stateVersion = "23.05";
  };

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.static-nxpkgs
      outputs.overlays.static-hmpkgs
      inputs.emacs-community.overlay
    ];

    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
}
