CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"

cp -r $CONFIG_DIR/hypr .config/
cp -r $CONFIG_DIR/niri .config/
cp -r $CONFIG_DIR/nvim .config/
cp -r $CONFIG_DIR/kitty .config/
cp -r $CONFIG_DIR/alacritty .config/
cp -r $CONFIG_DIR/fish .config/
cp -r $CONFIG_DIR/fastfetch .config/
cp -r $CONFIG_DIR/bat .config/
cp -r $CONFIG_DIR/btop .config/
cp -r $CONFIG_DIR/tmux .config/
cp -r $CONFIG_DIR/rofi .config/
cp -r $CONFIG_DIR/cava .config/
cp -r $CONFIG_DIR/yazi .config/
cp -r $CONFIG_DIR/elio .config/
cp $HOME/.bashrc ./
cp $HOME/.zshrc ./
cp $HOME/.vimrc ./
cp $HOME/.p10k.zsh ./
cp $HOME/.clang-format ./
