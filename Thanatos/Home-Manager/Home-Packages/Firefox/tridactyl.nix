{ inputs, outputs, lib, config, pkgs, ... }: {

  home.packages = with pkgs; [
    tridactyl-native
  ];
}
