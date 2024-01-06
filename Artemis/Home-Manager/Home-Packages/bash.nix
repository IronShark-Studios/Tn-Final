{ inputs, outputs, lib, config, pkgs, ... }: {

  programs.bash = {
    enable = true;

    profileExtra = ''
      xrandr --output HDMI-2 --mode 1920x1080 --rate 60
    '';
  };
}
