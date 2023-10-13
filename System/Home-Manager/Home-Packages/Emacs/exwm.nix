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
