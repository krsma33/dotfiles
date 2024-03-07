# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/krsma/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# env variables
export BROWSER=wslview
export TERM=wezterm
export DOTNET_ROOT=/opt/dotnet

# oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.config/oh_my_posh_themes/multiverse-neon-custom.omp.json)"

# f-sy-h needs to be on last line
source ~/.config/fsh/fast-syntax-highlighting.plugin.zsh
