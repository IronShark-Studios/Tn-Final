{ inputs, outputs, lib, config, pkgs, ... }: {

  programs.bash = {
    enable = true;

    profileExtra = ''
      polybar thanatos &
      pnmixer &
      # nm-applet &
      emacs
    '';
  };
}
