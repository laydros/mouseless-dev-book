
# setup to autoload stuff from external folder
# I don't really understand this yet since so far we
# also manually source stuff
fpath=($ZDOTDIR/external $fpath)

source "$XDG_CONFIG_HOME/zsh/aliases"
source "$XDG_CONFIG_HOME/zsh/scripts.sh"

setopt AUTO_PARAM_SLASH
unsetopt CASE_GLOB

# navigate autocomplete with vim keys
# needs to be before autoloading compinit
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# handy to also install zsh-completions
autoload -U compinit; compinit

# Autocomplete hidden files
_comp_options+=(globdots)
source "$ZDOTDIR/external/completion.zsh"

# bd to jump to parent directory
source "$ZDOTDIR/external/bd.zsh"

autoload -Uz prompt_purification_setup; prompt_purification_setup

# Push the current directory visited on to the stack
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack.
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using pushd or popd
setopt PUSHD_SILENT

# enable vi mode - not sure if I can stick with this...
bindkey -v
export KEYTIMEOUT=1

# change cursor depending on insert or command mode
autoload -Uz cursor_mode && cursor_mode

# use neovim to edit commands
autoload -Uz edit-command-line
zle -N edit-command-line

bindkey -M vicmd v edit-command-line

# after installing pkg zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#######
# fzf #
#######

if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

# default keybindings
# CTRL+t - search for a file in the current dir and sub-dir
# CTRL+r - search for an entry in the command history
# ALT+c  - Allow you to select a sub-directory and make it your working directory
# fuzzy search for process to kill with `kill` followed by TAB

# autostart X11
if [ "$(tty)" = "/dev/tty1" ];
then
    pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi

