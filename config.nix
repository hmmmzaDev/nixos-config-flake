{
  username = "hamza";
  gitUser = "hamza";
  gitEmail = "hmmmzadev@gmail.com";
  host = "hydenix";
  /*
    Default password is required for sudo support in systems
    !REMEMBER TO USE passwd TO CHANGE THE PASSWORD!
  */
  defaultPassword = "test";
  timezone = "Asia/Karachi";
  locale = "en_US.UTF-8";

  # hardware config - sudo nixos-generate-config --show-hardware-config > hardware-configuration.nix
  hardwareConfig = (toString ./hardware-configuration.nix);

  # List of drivers to install in ./hosts/nixos/drivers.nix
  drivers = [
    "amdgpu"
    "intel"
  ];

  # List of nix modules to import in ./hosts/nixos/default.nix
  nixModules = [
    (toString ./system-config/overrides.nix)
    (toString ./system-config/packages.nix)
  ];
  # List of nix modules to import in ./lib/mkConfig.nix
homeModules = [
  ({ pkgs, lib, ... }: {
    programs.zsh = {
      initExtra = ''
          export ANDROID_HOME="/home/hamza/Android/Sdk"
          export ANDROID_SDK_ROOT="/home/hamza/Android/Sdk"
          export CODE_DIR="/run/media/hamza/home/hamza/local/code"
      '';
    };

    home.sessionVariables = {
      CODE_DIR = "/run/media/hamza/home/hamza/local/code";
    };

    home.file.".config/waybar" = lib.mkForce {
      source = ./waybar-config;
      recursive = true;
      force = true;
      mutable = true;
    };

    home.file.".config/hypr" = lib.mkForce {
      source = ./hypr-config;
      recursive = true;
      force = true;
      mutable = true;
    };

/* wayland.windowManager.hyprland = {
  enable = true;
  extraConfig = ''
    monitor=,preferred,auto,1.5
  '';
}; */

  })
];

  hyde = rec {
    sddmTheme = "Candy"; # or "Corners"

    enable = true;

                  # wallbash config, sets extensions as active
    wallbash = {
      vscode = true;
    };

    # active theme, must be in themes list
    activeTheme = "Vanta Black";

    # list of themes to choose from
    themes = [
      # -- Default themes
      # "Catppuccin Latte"
#       "Catppuccin Mocha"
      # "Decay Green"
      #  "Edge Runner"
      # "Frosted Glass"
      # "Graphite Mono"
       # "Gruvbox Retro"
      # "Material Sakura"
      # "Nordic Blue"
      # "Rose Pine"
      # "Synth Wave"
#        "Tokyo Night"

      # -- Themes from hyde-gallery
      # "Abyssal-Wave"
      # "AbyssGreen"
#       "Bad Blood"
      # "Cat Latte"
      # "Crimson Blade"
      # "Dracula"
      # "Edge Runner"
      # "Green Lush"
      # "Greenify"
#       "Hack the Box"
      # "Ice Age"
      #  "Mac OS"
      # "Monokai"
      # "Monterey Frost"
#       "One Dark"
      # "Oxo Carbon"
      # "Paranoid Sweet"
      # "Pixel Dream"
      # "Rain Dark"
#       "Red Stone"
      # "Rose Pine"
      # "Scarlet Night"
       "Sci-fi"
      # "Solarized Dark"
      "Vanta Black"
      #  "Windows 11"
    ];

    # Exactly the same as hyde.conf
    conf = {
      hydeTheme = activeTheme;
      wallFramerate = 144;
      wallTransDuration = 0.4;
      wallAddCustomPath = "";
      enableWallDcol = 2;
      wallbashCustomCurve = "";
      skip_wallbash = [ ];
      themeSelect = 2;
      rofiStyle = 11;
      rofiScale = 9;
      wlogoutStyle = 1;
    };
  };




  vm = {
    # 4 GB minimum
    memorySize = 4096;
    # 2 cores minimum
    cores = 2;
    # 30GB minimum for one theme - 50GB for multiple themes - more for development and testing
    diskSize = 20000;
  };


programs.adb.enable = true;

}
