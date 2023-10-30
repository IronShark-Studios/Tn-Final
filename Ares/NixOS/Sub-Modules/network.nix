{ inputs, outputs, lib, config, pkgs, ... }: {

  networking = {
    hostName = "thanatos";
    networkmanager.enable = true;
    useDHCP = lib.mkDefault true;
  };


  services = {
    openssh = {
      enable = false;
      settings = {
        permitRootLogin = "no";
        passwordAuthentication = false;
      };
    };

    printing.enable = true;
  };
}
