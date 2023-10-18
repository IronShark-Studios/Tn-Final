{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./Home-Packages/home-manager.nix
    ./Home-Packages/Emacs/emacs.nix
    ./Home-Packages/alacritty.nix
    ./Home-Packages/firefox.nix
    ./Home-Packages/bash.nix
    ./Home-Packages/git.nix
    ./Home-Packages/polybar.nix
    ./Home-Packages/flameshot.nix
    ./Home-Packages/blueman.nix
  ];

  programs.home-manager.enable = true;

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
}
