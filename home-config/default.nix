{ lib, pkgs, config, ... }: {
home.file = {
    # rofi
    ".config/rofi/config.rasi" = {
        source = ./rofi/config.rasi; # path to your waybar config.rasi
        force = true;
        mutable = true;
    };
};
}
