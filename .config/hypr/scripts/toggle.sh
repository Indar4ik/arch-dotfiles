systemctl --user is-active --quiet hyprpaper.service && systemctl --user stop hyprpaper.service || systemctl --user start hyprpaper.service
systemctl --user is-active --quiet hyprpolkitagent.service && systemctl --user stop hyprpolkitagent.service || systemctl --user start hyprpolkitagent.service
