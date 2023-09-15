{ inputs, outputs, lib, config, pkgs, ... }: {

  system.stateVersion = "23.05";

  imports = [
    ./hardware-configuration.nix
    ./Sub-Modules/nixpkgs.nix
    ./Sub-Modules/users.nix
    ./Sub-Modules/utf.nix
    ./Sub-Modules/system-pkgs.nix
    ./Sub-Modules/services-exwm.nix
    ./Sub-Modules/services-xserver.nix
    ./Sub-Modules/network.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
  };

  services.cron = {
    enable = true;
    systemCronJobs = [
      "*/5 * * * *      root    date >> /tmp/cron.log"
    ];
  };
}
