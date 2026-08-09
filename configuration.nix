# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Dhaka";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."himaa" = {
    isNormalUser = true;
    description = "himaa";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim 
    git
    kitty
    firefox
    thunar
    wofi
    wget
  ];
  programs.hyprland = {
       enable = true;
       withUWSM = true;
      xwayland.enable = true;
  };
  environment.sessionVariables.Nixos_OZONE_WL = "1";
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
    
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
      # SDDM-কে X11 মোডে চালানো (ইন্টেল মাউস কার্সার ফিক্স)
    services.xserver.enable = true;

  # SDDM-কে X11 মোডে চালানো (ইন্টেল মাউস কার্সার ফিক্স)
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = false; 
  };

  # ইন্টেল গ্রাফিক্স ড্রাইভার এবং হার্ডওয়্যার অ্যাক্সিলারেশন চালু করা
  hardware.graphics.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
    
   # ব্লুটুথ হার্ডওয়্যার এবং ব্যাকগ্রাউন্ড সার্ভিস চালু করা
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true; # 'powerOnOnBoot' এর বদলে 'powerOnBoot' হবে

  # ব্লুটুথ কন্ট্রোল করার জন্য ব্লুম্যান (Blueman) ম্যানেজার চালু করা
  services.blueman.enable = true;
 
    # থুনার ফাইল ম্যানেজারে পেনড্রাইভ এবং হার্ডডিস্ক মাউন্ট করার ব্যাকগ্রাউন্ড সার্ভিস
  services.gvfs.enable = true;      # ফাইল সিস্টেম ব্যাকএন্ড
  services.udisks2.enable = true;   # ড্রাইভ অটো-ডিটেক্ট করার জন্য
  
  # এন্ড্রয়েড ফোন ক্যাবল দিয়ে কানেক্ট করলে ফাইল দেখার জন্য (MTP ও Storage)
  services.devmon.enable = true;



  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
