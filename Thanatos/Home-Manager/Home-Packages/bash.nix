{ inputs, outputs, lib, config, pkgs, ... }: {

  programs.bash = {
    enable = true;

    profileExtra = ''
      polybar thanatos &
      nm-applet &
      pnmixer &
      emacs
    '';
  };
}
