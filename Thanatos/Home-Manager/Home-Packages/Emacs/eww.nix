{ inputs, outputs, lib, config, pkgs, ... }: {

  programs.eww = {
    enable = true;
    # configDir = path to config dir;
  };
}
