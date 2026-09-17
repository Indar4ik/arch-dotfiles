CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"

ln -sf $(pwd)/.bashrc $HOME/
ln -sf $(pwd)/.zshrc $HOME/
ln -sf $(pwd)/.vimrc $HOME/
ln -sf $(pwd)/.p10k.zsh $HOME/
ln -sf $(pwd)/.config/kitty $CONFIG_DIR
ln -sf $(pwd)/.config/nvim $CONFIG_DIR
ln -sf $(pwd)/.config/alacrity $CONFIG_DIR
ln -sf $(pwd)/.config/fish $CONFIG_DIR
ln -sf $(pwd)/.config/fastfetch $CONFIG_DIR
ln -sf $(pwd)/.config/bat $CONFIG_DIR
ln -sf $(pwd)/.config/btop $CONFIG_DIR
ln -sf $(pwd)/.config/tmux $CONFIG_DIR
ln -sf $(pwd)/.config/rofi $CONFIG_DIR
ln -sf $(pwd)/.config/cava $CONFIG_DIR
ln -sf $(pwd)/.config/yazi $CONFIG_DIR
ln -sf $(pwd)/.config/elio $CONFIG_DIR

ln -sf $(pwd)/.config/hypr $CONFIG_DIR
ln -sf $(pwd)/.config/niri $CONFIG_DIR
