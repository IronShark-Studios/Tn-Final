{ inputs, outputs, lib, config, pkgs, ... }: {

  programs.bash = {
    enable = true;

    profileExtra = ''
      udiskie --no-notify --tray &
      nm-applet &
      pnmixer &
    '';
  };
}
