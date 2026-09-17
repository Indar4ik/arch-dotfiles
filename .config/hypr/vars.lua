return {
    CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}",
    hypr = "${XDG_CONFIG_HOME:-$HOME/.config}/hypr/",
    launcher = "rofi -show drun -theme ${XDG_CONFIG_HOME:-$HOME/.config}/rofi/launchers/",
    scripts = "${XDG_CONFIG_HOME:-$HOME/.config}/hypr/scripts/",
    mainMod = "SUPER",
    terminal = "kitty",
    terminal1 = "alacritty",
    fileManager = "thunar",
    ipc = "noctalia msg"
}
