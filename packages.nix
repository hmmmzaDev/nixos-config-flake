{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
      google-chrome
      ripgrep
      hyprpolkitagent
      polkit_gnome
      tmux
      zip
  ];
}
