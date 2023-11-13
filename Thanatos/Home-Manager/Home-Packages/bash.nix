{ inputs, outputs, lib, config, pkgs, ... }: {

  programs.bash = {
    enable = true;

    profileExtra = ''
      xdg-mime default org-protocol.desktop x-scheme-handler/org-protocol
      polybar thanatos &
      nm-applet &
      pnmixer &
      emacs
    '';
  };
}
