{ inputs, outputs, lib, config, pkgs, ... }: {

  home = {
    packages = with pkgs; [
      tridactyl-native
    ];

    file."tridactyl.nix" = {
      target = ".config/tridactyl/tridactylrc";
      text = ''
        nmap e scrollUp
        nmap n scrollDown
      '';
      };
  };
}
