{ inputs, outputs, lib, config, pkgs, ... }: {

  programs.alacritty = {
    enable = true;
    settings = {
    };
  };

  home.file."alacritty.yml" = {
    target = ".config/alacritty/alacritty.yml";
    text = ''
      shell:
        program: /home/xin/.nix-profile/bin/zsh
        args:
          - --login

      save_to_clipboard: true

      padding:
        x: 3
        y: 3

      font:
        family: "Iosevka"
        size: 16
        weight: "Regular"
        ligatures: true
        monospace: "Iosevka Mono"

      colors:
        primary:
           background: "#20282f"
           foreground: "#C5C8C6"
        cursor:
          text: "#f8f8f2"
          background: "#5ec4ff"

      visual_bell:
        animation: EaseOutExpo
        duration: 0
        color: '0xffffff'

      cursor:
        style:
          shape: "block"
          blinking: Always
          blink_interval: 500


    '';
  };

  home.file = {
    "alacritty-escape.sh" = {
      target = ".config/scripts/alacritty-escape.sh";
      text = ''
        #!/bin/sh

        alacritty --send-command set_mode Vi
        alacritty --send-command keybind escape exit_insert_mode
      '';
    };
  };
}
