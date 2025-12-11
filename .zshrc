export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
export EDITOR=neovim
export VISUAL=neovim
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

ZSH_THEME="gentoo"
ENABLE_CORRECTION="true"
PATH="$PATH":"$HOME/.local/scripts/"

plugins=(zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

bindkey -s '^F' 'tmux-sessionizer\n'
bindkey '^Y' autosuggest-accept

alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias vim='nvim'
