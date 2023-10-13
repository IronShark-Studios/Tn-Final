{ inputs, outputs, lib, config, pkgs, ... }: {

programs.emacs = {
  enable = true;
  package = pkgs.emacs-unstable;
  };

services.emacs = {
  enable = true;
  defaultEditor = true;
  extraOptions = [
    "exwm-enable"
    ];
  };
}
