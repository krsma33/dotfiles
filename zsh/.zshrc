
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/krsma/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Edit command line in editor
autoload edit-command-line
zle -N edit-command-line
bindkey '^X^e' edit-command-line

# env variables
export BROWSER=wslview
export TERM=wezterm
export DOTNET_ROOT=/opt/dotnet
export VISUAL=nvim
export EDITOR="$VISUAL"

# oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.config/oh_my_posh_themes/multiverse-neon-custom.omp.json)"

# f-sy-h needs to be on last line
source ~/.config/fsh/fast-syntax-highlighting.plugin.zsh
