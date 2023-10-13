{ inputs, outputs, lib, config, pkgs, ... }: {

programs.emacs = {
  enable = true;
  # package = pkgs.emacs-unstable;
  package = (pkgs.emacsWithPackagesFromUsePackage {
    config = ./init.el;
    defaultInitFile = true;
    package = pkgs.emacs-unstable;
    alwaysEnsure = true;
    extraEmacsPackages = epkgs: [
       # Anything needed but not specified in init.el
      ];
    });
  };

services.emacs = {
  enable = true;
  defaultEditor = true;
  extraOptions = [
    "exwm-enable"
    ];
  };
}
