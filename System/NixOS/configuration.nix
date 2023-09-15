{ inputs, outputs, lib, config, pkgs, ... }: {

  system.stateVersion = "23.05";

  imports = [
    ./hardware-configuration.nix
    ./nixpkgs.nix
    ./users.nix
    ./utf.nix
    ./system-pkgs.nix
    ./services-exwm.nix
    ./services-xserver.nix
    ./network.nix
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
