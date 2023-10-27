{ inputs, outputs, lib, config, pkgs, ... }: {

  programs.lf = {
    enable = true;
    keybindings = {
      n = "down";
      e = "up";
      o = "open";
      m = "up-one-dir";
    };
  };
}
