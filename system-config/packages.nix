{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
      google-chrome
      ripgrep
      # hyprpolkitagent
      tmux
      zip
      polkit_gnome



      gcc
      clang

      tmux

    mongodb-compass


    pandoc
    tectonic


    tor-browser
    tor
    torsocks


    anydesk
    filezilla

    vlc


    nodejs
    pnpm
    typescript
    vtsls


    obsidian
    stremio
    telegram-desktop


    docker
    lazydocker


    code-cursor

  ];




  programs.nix-ld.enable = true;
programs.nix-ld.libraries = [];


  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };
  users.users.hamza.extraGroups = [ "networkmanager" "wheel" "docker" ];
  # virtualisation.docker.enable = true;
  /* systemd.services.docker = {
    description = "Docker Daemon";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig.ExecStart = "${pkgs.docker}/bin/dockerd";
    # restart = "always";
  }; */
}
