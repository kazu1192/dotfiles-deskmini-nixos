# ffmpeg Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, callPackage, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  # networking.useDHCP = false;
  # networking.interfaces.enp37s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking = {
    hostName = "nixox";
    useDHCP = false;
    interfaces = {
      wlp2s0.useDHCP = true;
    };
    networkmanager.enable = true;
  };

  location = {
    latitude = 35.4;
    longitude = 139.6;
  };

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enabled = "fcitx";
      fcitx.engines = with pkgs.fcitx-engines; [ mozc ];
    };
  };
  
  console = {
    font = "LatArCyrHeb-16";
    keyMap = "us";
  };

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      fira-code
      fira-code-symbols
      font-awesome
    ];
  };

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    nox pavucontrol ffmpeg
    gnome3.networkmanagerapplet
    cmake gcc gnumake nodejs 
    git tig ghq gitAndTools.hub
    fzf peco
    wget vim neovim tmux unzip
    exa bat fd procs ripgrep
    termite alacritty terminator
    zsh starship fish screenfetch
    rofi conky nitrogen picom
    dunst parcellite volumeicon
    chromium firefox vivaldi
    # dropbox - we don't need this in the environment. systemd unit pulls it in
    # dropbox-cli
    # xorg.xbacklight
  ];

  environment.pathsToLink = [ "/libexec" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  #   pinentryFlavor = "gnome3";
  # };
  programs.ssh.askPassword = "";
  programs.light.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 17500 ];
    allowedUDPPorts = [ 17500 ];
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;
  
  services.xserver = {
    enable = true;
    layout = "us";
    # videoDrivers = [ "intel" ];
    libinput.enable = true;

    desktopManager = {
      xterm.enable = false;
    };

    displayManager = {
      # sddm.enable = true;
      # startx.enable = true;
      defaultSession = "none+i3";
    };

    windowManager = {
      i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        extraPackages = with pkgs; [
          dmenu #application launcher most people use
          i3status # gives you the default i3 status bar
          i3lock #default i3 screen locker
          i3blocks #if you are planning on using i3blocks over i3status
        ];
      };
    };
  };

  services.redshift = {
    enable = true;
    brightness = {
      # Note the string values below.
      day = "1";
      night = "0.8";
    };
    temperature = {
      day = 6000;
      night = 5000;
    };
  };

  services.cron = {
    enable = true;
    systemCronJobs = [
      "* 23 * * *  root  cat /etc/nixos/configuration.nix > /home/host/.dotfiles/nixos/configuration.nix"
    ];
  };

  security.sudo.enable = true;

  virtualisation.docker.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.jane = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  # };

  users.motd = "[0m[34m          ::::.    [0m[1;34m':::::     ::::'          [0m[1;34m root[0m[1m@[0m[0m[1;34mnixox[0m\n[0m[34m          ':::::    [0m[1;34m':::::.  ::::'           [0m[1;34m OS:[0m NixOS 20.09.2181.3a02dc9edb2 (Nightingale)[0m\n[0m[34m            :::::     [0m[1;34m'::::.:::::            [0m[1;34m Kernel:[0m x86_64 Linux 5.4.81[0m\n[0m[34m      .......:::::..... [0m[1;34m::::::::             [0m[1;34m Uptime:[0m 10m[0m\n[0m[34m     ::::::::::::::::::. [0m[1;34m::::::    [0m[34m::::.     [0m[1;34m Packages:[0m 6690[0m\n[0m[34m    ::::::::::::::::::::: [0m[1;34m:::::.  [0m[34m.::::'     [0m[1;34m Shell:[0m bash 4.4.23[0m\n[0m[1;34m           .....           ::::' [0m[34m:::::'      [0m[1;34m Resolution:[0m 1920x1080[0m\n[0m[1;34m          :::::            '::' [0m[34m:::::'       [0m[1;34m WM:[0m i3[0m\n[0m[1;34m ........:::::               ' [0m[34m:::::::::::.  [0m[1;34m Disk:[0m 46G / 110G (45%)[0m\n[0m[1;34m:::::::::::::                 [0m[34m:::::::::::::  [0m[1;34m CPU:[0m Intel Core i3-8145U @ 4x 3.9GHz [63.0°C][0m\n[0m[1;34m ::::::::::: [0m[34m..              :::::           [0m[1;34m GPU:[0m Intel Corporation UHD Graphics 620 (Whiskey Lake)[0m\n[0m[1;34m     .::::: [0m[34m.:::            :::::            [0m[1;34m RAM:[0m 1414MiB / 3612MiB[0m\n[0m[1;34m    .:::::  [0m[34m:::::          '''''    [0m[1;34m.....    [0m\n[0m[1;34m    :::::   [0m[34m':::::.  [0m[1;34m......:::::::::::::'    [0m\n[0m[1;34m     :::     [0m[34m::::::. [0m[1;34m':::::::::::::::::'     [0m\n[0m[34m            .:::::::: [0m[1;34m'::::::::::            [0m\n[0m[34m           .::::''::::.     [0m[1;34m'::::.           [0m\n[0m[34m          .::::'   ::::.     [0m[1;34m'::::.          [0m\n[0m[34m         .::::      ::::      [0m[1;34m'::::.         [0m";

  users.users.host = {
    isNormalUser = true;
    createHome = true;
    group = "users";
    extraGroups = [ "wheel" "networkmanager" "docker" "video" ];
    shell = pkgs.bash;
    uid = 1000;
  };

  systemd.user.services.dropbox = {
    description = "Dropbox";
    wantedBy = [ "graphical-session.target" ];
    environment = {
      QT_PLUGIN_PATH = "/run/current-system/sw/" + pkgs.qt5.qtbase.qtPluginPrefix;
      QML2_IMPORT_PATH = "/run/current-system/sw/" + pkgs.qt5.qtbase.qtQmlPrefix;
    };
    serviceConfig = {
      ExecStart = "${pkgs.dropbox.out}/bin/dropbox";
      ExecReload = "${pkgs.coreutils.out}/bin/kill -HUP $MAINPID";
      KillMode = "control-group"; # upstream recommends process
      Restart = "on-failure";
      privateTmp = true;
      ProtectSystem = "full";
      Nice = 10;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?

}

