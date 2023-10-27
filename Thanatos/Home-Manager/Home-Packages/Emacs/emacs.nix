{ inputs, outputs, lib, config, pkgs, ... }: {

  programs.emacs = {
    enable = true;
    package = (pkgs.emacsWithPackagesFromUsePackage {
      config = ./init.el;
      defaultInitFile = true;
      package = pkgs.emacs-unstable;
      alwaysEnsure = true;
      extraEmacsPackages = epkgs: with epkgs; [
      ];
    });
  };

  home = {
    packages = with pkgs; [
      fd
      silver-searcher
      hunspell
      hunspellDicts.en_US-large
      networkmanagerapplet
    ];

    file = {
      emacs-init = {
        source = ./init.el;
        target = ".config/emacs/init.el";
      };

      emacs-bookmarks = {
        source = config.lib.file.mkOutOfStoreSymlink ./bookmarks;
        target = ".config/emacs/bookmarks";
      };

      # emacs-sub-modules = {
      #   source = ./Sub-Modules;
      #   target = ".config/emacs/Sub-Modules";
      #   recursive = true;
      # };
    };
  };

}
