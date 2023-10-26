{ inputs, outputs, lib, config, pkgs, ... }: {

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
    };
  };
}
