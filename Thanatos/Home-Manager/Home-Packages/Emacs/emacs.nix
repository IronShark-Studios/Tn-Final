{ inputs, outputs, lib, config, pkgs, ... }: {

  home.file.emacs-init = {
    source = ./init.el;
    target = ".config/emacs/init.el";
  };

  home.file.emacs-bookmarks = {
    source = config.lib.file.mkOutOfStoreSymlink ./bookmarks;
    target = ".config/emacs/bookmarks";
  };

  programs.emacs = {
    enable = true;
    package = (pkgs.emacsWithPackagesFromUsePackage {
      config = ./init.el;
      defaultInitFile = true;
      package = pkgs.emacs-unstable;
      alwaysEnsure = true;
      extraEmacsPackages = epkgs: with epkgs; [
        # Anything needed by Emacs but not specified in init.el
      ];
    });
  };

  home.packages = with pkgs; [
    fd
    silver-searcher
    hunspell
    hunspellDicts.en_US-large
    networkmanagerapplet
  ];
}
