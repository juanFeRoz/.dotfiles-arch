export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
export EDITOR=neovim
export VISUAL=neovim

ZSH_THEME="gentoo"
ENABLE_CORRECTION="true"
PATH="$PATH":"$HOME/.local/scripts/"

plugins=(zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

bindkey -s '^F' 'tmux-sessionizer\n'
bindkey '^Y' autosuggest-accept

alias config='git --git-dir=/home/juanfe/.cfg/ --work-tree=/home/juanfe'
