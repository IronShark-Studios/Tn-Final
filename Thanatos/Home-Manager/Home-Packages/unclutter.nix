{ inputs, outputs, lib, config, pkgs, ... }: {

  services.unclutter = {
    enable = true;
    timeout = 3;
  };
}
