{ inputs, outputs, lib, config, pkgs, ... }: {

  home.file."Thunar.conf" = {
    target = ".config/Thunar/Thunar.conf";
    text = ''
      [Thunar]
      theme-name=Adwaita-dark
    '';
  };
}
