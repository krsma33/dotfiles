# Show system info
neofetch

# If it's not running interactively, don't do anything
[[ $- != *i* ]] && return

# Turn off all beeps
unsetopt BEEP

# Enable colors and change prompt:
autoload -U colors && colors

# History in cache directory
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
# Auto complete with case insensitivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit
_comp_options+=(globdots) # Inlcude hidden files

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Edit line in vim buffer ctrl-v
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line

# Bind ctrl-b to show list of choices
bindkey '^B' list-choices
# Bind ctrl-space to open menu
bindkey -s '^@' '^B^I'
# Bind tab to complete
bindkey '^K' autosuggest-accept
# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char
# Fix backspace in vim modes
bindkey -v "^?" backward-delete-char

# Change cursor shape for different vi modes
function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
  zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
  echo -ne "\e[5 q"
}
zle -N zle-line-init

echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q'; } # Use beam shape cursor for each new prompt.

# Env variables
export BROWSER=wslview
export TERM=wezterm
export DOTNET_ROOT=/opt/dotnet
export VISUAL=nvim
export EDITOR="$VISUAL"

# Oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.config/oh_my_posh_themes/sonicboom-custom.omp.json)"

# Fzf key bindings
source /usr/share/fzf/key-bindings.zsh

# Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# F-sy-h needs to be on last line
source ~/.config/fsh/fast-syntax-highlighting.plugin.zsh
