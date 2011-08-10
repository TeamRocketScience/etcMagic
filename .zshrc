PS1='[\u@\h \[\033[01;30m\]\D{%H:%M}\[\033[00m\] \w]$'
prompt='%U%n%u:%B%~%b# '
PROMPT2='%_> '
echo "\\e[1;9]\\e[8]"
RPS1='<%U%m%u >'

### Основные настройки
LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:ex=01;32:mi=5;31;46:or=5;31;46:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.deb=01;31:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.ppm=01;35:'
LS_OPTIONS="-F -B --color=auto"

### Определения по умолчанию
## Я использую MOST. Вам тоже советую, но решайте сами:
#PAGER=/usr/bin/less

command_oriented_history=1
HISTCONTROL=ignoreboth
ulimit -c unlimited
umask 022
mesg y

### Синонимы LS и V

alias hsc="nano /etc/hosts"
alias -s conf=nano
alias -s ini=nano
alias pid="ps -A | grep"
alias ls="alias ls='ls --color=auto'
alias grep='grep --colour=auto'"
alias v="ls $LS_OPTIONS --format=long"
alias l="v"
alias upme="apt-get update"
alias upgme="apt-get upgrade"
alias aliasc="nano ~/.zshrc"
alias aptc="nano /etc/apt/sources.list"
alias phpc="nano /etc/php5/apache2/php.ini"
alias a2c="nano /etc/apache2/apache2.conf"
alias webup="service apache2 start"
alias webdown="service apache2 stop"
alias i="mtr google.com"
alias hire="apt-get --force-yes --yes install"
alias hiref="apt-fast --force-yes --yes install"
alias fire="apt-get --purge remove"

alias upup="apt-get update && apt-get upgrade --force-yes"
alias ss="sudo -s"
alias a2log="tail -n80 /var/log/apache2/access.log"
alias a2err="tail -n80 /var/log/apache2/error.log"

### Экспортировать все
export PS1 NLSPATH PAGER MAIL LS_COLORS LS_OPTIONS LIBRARY_PATH \
            C_INCLUDE_PATH CPLUS_INCLUDE_PATH EDITOR TERM XFILESEARCHPATH

### Настройка журнала команд
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=8192
export SAVEHIST=8192

### Сокращенные команды CD
export CDPATH=.:~

### Список расширений файлов, которые ls должен игнорировать
export FIGNORE="~:.o"

### Это очень интересные штуки, объясню кое-что ниже
setopt share_history
setopt appendhistory
setopt autocd
setopt automenu
setopt autopushd
setopt autoresume
setopt complete_in_word
setopt extended_glob
setopt hist_ignoredups
setopt hist_ignorespace
setopt list_types
setopt mailwarning
setopt no_flowcontrol
setopt no_hup
setopt no_notify
setopt printexitvalue
setopt pushd_ignoredups
setopt pushd_silent

### Убедимся, что клавиатура будет работать с любым терминалом
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line
bindkey '^[[2~' overwrite-mode
bindkey '^[[3~' delete-char
bindkey '^[[6~' end-of-history
bindkey '^[[5~' beginning-of-history
bindkey '^[^I' reverse-menu-complete
bindkey '^[OA' up-line-or-history
bindkey '^[[A' up-line-or-history
bindkey '^[[B' down-line-or-history
bindkey '^[OB' down-line-or-history
bindkey '^[OD' backward-char
bindkey '^[OC' forward-char
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey '^[[[A' run-help
bindkey '^[[[B' which-command
bindkey '^[[[C' where-is
bindkey '^D' list-choices
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

### См. в конце
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

### Использовать журнал от предыдущих сессий
fc -R $HISTFILE

### Вызываем обновление
_force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1
}

### Загрузка стиля дополнения
zstyle ':completion:*' completer \
  _oldlist _expand _force_rehash _complete

### run-help
autoload run-help

### Загрузка compinit
autoload -U compinit
compinit

export EDITOR=nano