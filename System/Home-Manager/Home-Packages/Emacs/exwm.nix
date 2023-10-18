{ inputs, outputs, lib, config, pkgs, ... }: {

programs.emacs = {
  enable = true;
  package = (pkgs.emacsWithPackagesFromUsePackage {
    config = ./init.el;
    defaultInitFile = true;
    package = pkgs.emacs-unstable;
    alwaysEnsure = true;
    extraEmacsPackages = epkgs: with epkgs; [
       # Anything needed but not specified in init.el
      ];
    });
  };
}
