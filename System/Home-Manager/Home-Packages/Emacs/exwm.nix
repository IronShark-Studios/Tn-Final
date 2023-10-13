{ inputs, outputs, lib, config, pkgs, ... }: {

programs.emacs = {
  enable = true;
  package = "emacs-unstable";
  };

sevices.emacs = {
  enable = true;
  defaultEditor = true;
  extraOptions = [
    "exwm-enable"
    ];
  };
}
