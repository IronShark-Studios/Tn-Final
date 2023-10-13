{ inputs, outputs, lib, config, pkgs, ... }: {

programs.emacs = {
  enable = true;
  package = "emacs-unstable";
  };

services.emacs = {
  enable = true;
  defaultEditor = true;
  extraOptions = [
    "exwm-enable"
    ];
  };
}
