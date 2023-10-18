{ inputs, outputs, lib, config, pkgs, ... }: {

  environment = {
    systemPackages = with pkgs; [
      wget
      unzip
      alsa-utils
    ];
  };

  fonts.packages = with pkgs; [
    nerdfonts
    iosevka
    overpass
    fira-code
    fira-go
  ];
}
