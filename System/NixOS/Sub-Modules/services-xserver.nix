{ inputs, outputs, lib, config, pkgs, ... }: {

  environment = {
    systemPackages = with pkgs; [
      blueman
      chromium
      deja-dup
      drawing
      elementary-xfce-icon-theme
      evince
      firefox
      foliate
      font-manager
      gimp-with-plugins
      gnome.file-roller
      gnome.gnome-disk-utility
      inkscape-with-extensions
      libqalculate
      libreoffice
      orca
      pavucontrol
      qalculate-gtk
      thunderbird
      wmctrl
      xclip
      xcolor
      xcolor
      xdo
      xdotool
      xfce.catfish
      xfce.gigolo
      xfce.orage
      xfce.xfburn
      xfce.xfce4-appfinder
      xfce.xfce4-clipman-plugin
      xfce.xfce4-cpugraph-plugin
      xfce.xfce4-dict
      xfce.xfce4-fsguard-plugin
      xfce.xfce4-genmon-plugin
      xfce.xfce4-netload-plugin
      xfce.xfce4-panel
      xfce.xfce4-pulseaudio-plugin
      xfce.xfce4-systemload-plugin
      xfce.xfce4-weather-plugin
      xfce.xfce4-whiskermenu-plugin
      xfce.xfce4-xkb-plugin
      xfce.xfdashboard
      xorg.xev
      xsel
      xtitle
      xwinmosaic
      sddm-chili-theme
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
     #   noDesktop = true;
     #   enableXfwm = false;
      };
    };

    unclutter-xfixes.enable = true;
    picom.enable = true;
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
