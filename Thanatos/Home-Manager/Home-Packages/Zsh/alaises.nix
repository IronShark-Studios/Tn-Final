{ inputs, outputs, lib, config, pkgs, ... }: {

  programs.zsh.shellAliases = {
    cd = "z";
    lx = "ls -la";
    ll = "ls -l";
    rma = "move_to_tmp() { mv "$1" /tmp }";
    power-off = "sudo shutdown -h now";
    logout = "sudo kill -9 -1";
    restart = "sudo reboot";
    eo = "emacsclient -n";
    rebuild = "bash /etc/scripts/rebuild.sh";
    upgrade = "bash /etc/scripts/upgrade.sh";
    test = "bash /etc/scripts/test.sh"
    clean = "sudo nix-collect-garbage --delete-old && rebuild";
    cb = "xclip -selection clipboard";
  };
}
