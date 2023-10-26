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

      key_bindings:
        - { key: Space, mods: Shift, action: "ToggleViMode" }
        - { key: u, mode: "Vi", action: "ToggleViMode" }
        - { key: m, mode: "Vi", action: "Left" }
        - { key: n, mode: "Vi", action: "Down" }
        - { key: e, mode: "Vi", action: "Up" }
        - { key: i, mode: "Vi", action: "Right" }

    '';
  };

  home.packages = with pkgs; [
    lf
    vim
    btop
    htop
    nmon
    fzf
    rsync
    neofetch
  ];
}
