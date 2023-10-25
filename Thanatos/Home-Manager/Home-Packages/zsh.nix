{ inputs, outputs, lib, config, pkgs, ... }: {

  programs.zsh = {
    enable = true;

    shellAliases = {
      lx = "ls -la";
      ll = "ls -l";
      rma = "rm -rf";
      power-off = "sudo shutdown -h now";
      logout = "sudo kill -9 -1";
      restart = "sudo reboot";
      eo = "emacsclient -n";
      rebuild = "bash /etc/scripts/rebuild.sh";
      upgrade = "bash /etc/scripts/upgrade.sh";
      clean = "sudo nix-collect-garbage --delete-old && rebuild";
      cb = "xclip -selection clipboard";
    };

    sessionVariables = {
      SUDO_EDITOR = "\"emacsclient\"";
      NIXOS_GENERATION = "$(nix-env --list-generations | tail -n 1 | sed 's/(current)//')";
    };

    enableCompletion = true;

    autocd = true;

    enableAutosuggestions = true;

    syntaxHighlighting = {
      enable = true;
      styles = {
        comment = "fg=#608CAE,underline";
        constant = "fg=#C0B0CA,bold";
        entity = "fg=#635687,italic";
        function = "fg=#2CC6E6";
        alias = "fg=#F71792";
        suffix-alias = "fg=#F71792,bold";
        global-alias = "fg=#F71792,bold";
        builtin = "fg=#20557A";
        reserved-word = "fg=#6558A5,bold";
        hashed-command = "fg=#6558A5";
        path = "fg=#0B0B2F";
        globbing = "fg=#6558A5";
        history-expansion = "fg=#2CC6E6";
        single-hyphen-option = "fg=#6558A5,bold";
        double-hyphen-option = "fg=#6558A5,bold";
        back-quoted-argument = "fg=#0B0B2F";
        single-quoted-argument = "fg=#0B0B2F";
        double-quoted-argument = "fg=#0B0B2F";
        dollar-double-quoted-argument = "fg=#0B0B2F";
        back-double-quoted-argument = "fg=#0B0B2F";
        assign = "fg=#FA1593";
        precommand = "fg=#0B0B2F,italic";
        autodirectory = "fg=#0B0B2F,bold";
        commandseparator = "fg=#0B0B2F,bold";
        command-substitution-delimiter = "fg=#0B0B2F,bold";
        command-substitution-delimiter-unquoted = "fg=#0B0B2F";
        unknown-token = "fg=#D85908";
      };
    };
  };

  home.packages = with pkgs; [
    ranger
    vim
  ];

}
