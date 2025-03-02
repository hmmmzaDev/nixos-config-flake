{ lib, pkgs, config, ... }: {
  # Disable specific programs
  programs = {
    steam.enable = lib.mkForce false;
    gamemode.enable = lib.mkForce false;
  };

  # Prevent specific packages from being installed
  nixpkgs.overlays = [
    (final: prev: {
      # Create dummy packages that do nothing
      spotify = prev.runCommand "dummy-spotify" {} "mkdir $out";
      discord = prev.runCommand "dummy-discord" {} "mkdir $out";
      webcord = prev.runCommand "dummy-webcord" {} "mkdir $out";
      vesktop = prev.runCommand "dummy-vesktop" {} "mkdir $out";
      steam = prev.runCommand "dummy-steam" {} "mkdir $out";
      gamemode = prev.runCommand "dummy-gamemode" {} "mkdir $out";
      gamescope = prev.runCommand "dummy-gamescope" {} "mkdir $out";
      lutris = prev.runCommand "dummy-lutris" {} "mkdir $out";
      spicetify-cli = prev.runCommand "dummy-spicetify-cli" {} "mkdir $out";
      cava = prev.runCommand "dummy-cava" {} "mkdir $out";
      # polkit_gnome = prev.runCommand "dummy-polikit" {} "mkdir $out";
    })
  ];

  /* networking = {
    networkmanager = {
      enable = true;
      # Optional: use iwd backend for potentially better behavior
      wifi.backend = "iwd";
    };
  }; */

  # Instead of the problematic configuration, just ensure NetworkManager stores connections
  # networking.networkmanager.ensureProfiles.profiles = {};

  # Use hardcoded username
  users.users.hamza.extraGroups = [ "networkmanager" "wheel" ];
}
