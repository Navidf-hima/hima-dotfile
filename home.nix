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
    cliphist
    xfce.thunar-volman
    easyeffects
  ];

    wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  
   
     # VS Code ইনস্টল এবং কনফিগারেশন
  programs.vscode = {
    enable = true;
    # আপনি চাইলে সরাসরি unstable ভার্সন ব্যবহার করতে পারেন
    package = pkgs.vscode; 
    
    # আপনার কোডিং এর জন্য প্রয়োজনীয় এক্সটেনশনসমূহ (অটো-ইনস্টল হবে)
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix              # NixOS কোড হাইলাইট করার জন্য
      ms-azuretools.vscode-docker # ডকার সাপোর্ট
      ms-python.python          # পাইথন কোডিং এর জন্য
    ];

    # VS Code এর কিছু সুন্দর সেটিংস
    userSettings = {
      "window.titleBarStyle" = "custom";
      "editor.fontSize" = 14;
      "editor.fontFamily" = "'JetBrainsMono Nerd Font', monospace";
      "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font'";
      "workbench.colorTheme" = "Dark+"; # ডিফল্ট ডার্ক থিম
      "editor.minimap.enabled" = false; # ডানদিকের মিনিম্যাপ বন্ধ রাখা
    };
  };





  # আপনার ডিরেক্টরির hyprland.lua ফাইলটিকে সরাসরি NixOS এর সাথে লিংক করা
  xdg.configFile."hypr/hyprland.lua".source = 
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/hypr/hyprland.lua";
  # Home Manager কে নিজের সেটিংস নিজে ম্যানেজ করতে দেওয়া
  programs.home-manager.enable = true;
}

