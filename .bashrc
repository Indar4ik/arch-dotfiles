#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#alias '-'='cd -'
alias ...='../..'
alias ....='../../..'
alias .....='../../../..'
alias ......='../../../../..'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias make="make -j`nproc`"
alias ninja="ninja -j`nproc`"
alias n="ninja"
alias c="clear"
alias rmpkg="sudo pacman -Rsn"
alias cleanch="sudo pacman -Scc"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias update="$XDG_CONFIG_HOME/hypr/scripts/update.sh"
alias cachyos-rate-mirrors="sudo cachyos-rate-mirrors"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias dir='dir --color=auto'

alias l="ls -lA"
alias la="ls -A"
alias ll="ls -l"

# Cleanup orphaned packages
alias cleanup="sudo pacman -Rns $(pacman -Qtdq)"

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

# Proxy
alias von='export ALL_PROXY=socks5h://127.0.0.1:2080; export HTTP_PROXY=http://127.0.0.1:2080; export http_proxy=http://127.0.0.1:2080; export HTTPS_PROXY=http://127.0.0.1:2080'
alias voff='unset ALL_PROXY; unset HTTP_PROXY; unset http_proxy; unset HTTPS_PROXY'

# ==========================================
# ФУНКЦИЯ ДЛЯ ОТОБРАЖЕНИЯ GIT В PROMPT
# ==========================================
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# ==========================================
# НАСТРОЙКА СТРОКИ ПРИГЛАШЕНИЯ (PS1)
# ==========================================

# Цветовые коды (нежирные)
COLOR_USER="\[\033[01;32m\]"      # Зеленый для пользователя
COLOR_HOST="\[\033[01;36m\]"      # Циановый для хоста
COLOR_DIR="\[\033[01;34m\]"       # Синий для директории
COLOR_GIT="\[\033[01;33m\]"       # Желтый для Git ветки
COLOR_RESET="\[\033[00m\]"        # Сброс цвета

# Проверка на root (если root, то имя пользователя будет красным)
if [ "$EUID" -ne 0 ]; then
    USER_STYLE="${COLOR_USER}\u"
else
    USER_STYLE="\[\033[01;31m\]\u"
fi

# Сборка финальной строки приглашения: [время] пользователь@хост:директория (ветка_git) $
PS1="[\[\033[00;37m\]\t] ${USER_STYLE}${COLOR_RESET}@${COLOR_HOST}\h${COLOR_RESET}:${COLOR_DIR}\w${COLOR_GIT}\$(parse_git_branch)${COLOR_RESET}\$ "

