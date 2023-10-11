{ inputs, outputs, lib, config, pkgs, ... }: {

  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };

    xserver = {
      enable = true;
      libinput.enable = true;
      autorun = true;
      layout = "us";
      xkbVariant = "colemak_dh";
      xkbOptions = "caps:escape";

      displayManager = {
        sddm.enable = true;
        sddm.autoNumlock = true;
      };
    };

    unclutter-xfixes.enable = true;
    picom.enable = true;
  };

  sound.enable = true;
  hardware.pulseaudio.enable = false;
}
