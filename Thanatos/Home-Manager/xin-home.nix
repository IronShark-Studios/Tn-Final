{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./Home-Packages/home-manager.nix
    ./Home-Packages/Emacs/emacs.nix
    ./Home-Packages/XDG/user-dirs.nix
    ./Home-Packages/Alacritty/alacritty.nix
    ./Home-Packages/Alacritty/alacrittyConfig.nix
    ./Home-Packages/lf.nix
    ./Home-Packages/vim.nix
    ./Home-Packages/starship.nix
    ./Home-Packages/Firefox/firefox.nix
    ./Home-Packages/Firefox/policies.nix
    ./Home-Packages/Firefox/userChrome.nix
    ./Home-Packages/Firefox/tridactyl.nix
    ./Home-Packages/Firefox/extensions.nix
    ./Home-Packages/Zsh/zsh.nix
    ./Home-Packages/Zsh/theme.nix
    ./Home-Packages/Zsh/alaises.nix
    ./Home-Packages/Zsh/oh-my-zsh.nix
    ./Home-Packages/bash.nix
    ./Home-Packages/git.nix
    ./Home-Packages/thunar.nix
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
