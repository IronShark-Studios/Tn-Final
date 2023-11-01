{ inputs, outputs, lib, config, pkgs, ... }: {

  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    lfs.enable = true;
    userName = "xin";
    userEmail = "git@ironshark.org";
    ignores = [
      "*~"
      ".*~"
      "#*#"
      "'#*#'"
      ".*.swp"
    ];
    aliases = {
      send = ''
        status &&
        echo -n Commit Message:  &&
        read -r commitMessage &&
        add . &&
        commit -m \"$commitMessage\" &&
        push
      '';
    };
    extraConfig = {
      init = {
        defaultBranch = "main";
        pull = {
          rebase = true;
        };
      };
    };
  };
}
