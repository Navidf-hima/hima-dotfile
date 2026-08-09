{ config, pkgs, ... }:

{
  home.username = "himaa";
  home.homeDirectory = "/home/himaa";

  # আপনার সিস্টেমের স্টেট ভার্সন অনুযায়ী
  home.stateVersion = "26.05"; 
  fonts.fontconfig.enable = true;
  # হিমা-র ইউজার লেভেলের অতিরিক্ত প্যাকেজ (প্রয়োজন হলে আরও নাম লিখতে পারেন)
  home.packages = with pkgs; [
    waybar
    awww
    brightnessctl
    networkmanagerapplet
    pavucontrol
    wofi
    thunar       # স্ট্যাটাস বার
    dunst
    psmisc 
    nerd-fonts.jetbrains-mono
    grim
    slurp
    wl-clipboard
    cliphist       # নোটিফিকেশন এলার্ট
  ];

    wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  
  # আপনার ডিরেক্টরির hyprland.lua ফাইলটিকে সরাসরি NixOS এর সাথে লিংক করা
  xdg.configFile."hypr/hyprland.lua".source = 
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/hypr/hyprland.lua";
  # Home Manager কে নিজের সেটিংস নিজে ম্যানেজ করতে দেওয়া
  programs.home-manager.enable = true;
}

