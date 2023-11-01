{ inputs, outputs, lib, config, pkgs, ... }: {

  programs.bash = {
    enable = true;

    profileExtra = ''
      polybar thanatos &
      volumeicon &
      nm-applet &
      emacs
    '';
  };
}
