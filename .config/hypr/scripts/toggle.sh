systemctl --user is-active --quiet hyprpaper.service && systemctl --user stop hyprpaper.service || systemctl --user start hyprpaper.service
