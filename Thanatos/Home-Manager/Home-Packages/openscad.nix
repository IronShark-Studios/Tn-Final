{ inputs, outputs, lib, config, pkgs, ... }: {

  home = {
    packages = with pkgs; [
      openscad
    ];

    # file."tridactyl.nix" = {
    #   target = ".config/tridactyl/tridactylrc";
    #   text = ''
    #   '';
    #   };
    };
}
