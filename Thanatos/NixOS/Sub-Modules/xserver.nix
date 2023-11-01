{ inputs, outputs, lib, config, pkgs, ... }: {

  environment = {
    systemPackages = with pkgs; [
      xfce.xfce4-genmon-plugin
      sddm-chili-theme
      pavucontrol
      xorg.xev
      gparted
      xdotool
      slock
      xclip
      xcolor
      xsel
      xdo
    ];
  };

  programs = {
    dconf.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };
  };

  security.pam.services.gdm.enableGnomeKeyring = true;

  services = {
    blueman.enable = true;
    gnome.gnome-keyring.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };

    xserver = {
      enable = true;
      libinput.enable = true;
      autorun = true;
      layout = "us";
      xkbVariant = "colemak_dh";
      xkbOptions = "caps:escape";
      videoDrivers = [ "modesetting" ];
      excludePackages = with pkgs; [
        xterm
      ];

      displayManager = {
        sddm = {
          enable = true;
          autoNumlock = true;
          theme = "chili";
          };
      };

      desktopManager.xfce = {
        enable = true;
        enableScreensaver = false;
      };
    };

    unclutter = {
      enable = true;
      keystroke = false;
      threshold = 10;
      timeout = 1;
    };

    picom = {
      enable = true;
      vSync = true;
      backend = "glx";
    };
  };

  sound = {
    enable = true;
    mediaKeys.enable = true;
  };

  hardware = {
    pulseaudio.enable = false;
    bluetooth.enable = true;
  };
}
