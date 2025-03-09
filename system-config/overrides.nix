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

security.polkit.enable = true;

systemd.user.services.polkit-gnome-authentication-agent-1 = {
  description = "polkit-gnome-authentication-agent-1";
  wantedBy = [ "graphical-session.target" ];
  wants = [ "graphical-session.target" ];
  after = [ "graphical-session.target" ];
  serviceConfig = {
    Type = "simple";
    ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    Restart = "on-failure";
    RestartSec = 1;
    TimeoutStopSec = 10;
  };
};


  #mount the manjaro partition on boot
fileSystems."/run/media/hamza" = {
  device = "/dev/disk/by-uuid/26a05160-867c-4407-b621-0b7cb21e31c0";
  fsType = "ext4";
    options = [ "defaults" ];
};



}
