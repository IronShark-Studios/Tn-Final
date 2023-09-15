{ inputs, outputs, lib, config, pkgs, ... }: {

  environment = {
    systemPackages = with pkgs; [
      # pulseaudio
      # pulseaudio-ctl
      # pulsemixer
      polybar
      networkmanagerapplet
      volctl
      lm_sensors
      pciutils
      fd
      silver-searcher
      wget
      unzip
      hunspell
      hunspellDicts.en_US-large
      slock
      flameshot
    ];

    lxqt.excludePackages = with pkgs.lxqt; [
      qterminal
    ];
  };
}
