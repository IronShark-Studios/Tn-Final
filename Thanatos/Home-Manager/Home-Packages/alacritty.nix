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

      padding { x = 1 , y = 1 }

      font = {
        family = "Iosevka"
        size = 18
        weight = "Regular"
        italic = true
        bold = true
        ligatures = true
        monospace = true
      }

      colors = {
        primary = {
           background = "#191e24"
           foreground = "C5C8C6"
        }
        cursor = {
          text = "#f8f8f2"
          background = "#5ec4ff"
        }
      }

      bell = "visual"

      cursor = "block"
      cursor_blink = true

      key_bindings = {
        "ctrl+q" = "send_signal SIGINT"
        "ctrl+shift+space" = "set_mode Vi"
        "escape" = "send_command /path/to/set-vi-mode-to-escape.sh"
        "u" = "enter_insert_mode"
        "n" = "move_down"
        "e" = "move_up"
        "m" = "move_left"
        "i" = "move_right"
      }
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
