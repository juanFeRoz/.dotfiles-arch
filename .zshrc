PATH=$HOME/.local/share/JetBrains/Toolbox/scripts:$HOME/.local/scripts:$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
ZSH="$HOME/.oh-my-zsh"
DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
EDITOR=neovim
VISUAL=neovim
_JAVA_AWT_WM_NONREPARENTING=1
_JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
ZSH_THEME="gentoo"
ENABLE_CORRECTION="true"

plugins=(zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

bindkey -s '^F' 'tmux-sessionizer\n'
bindkey '^Y' autosuggest-accept

alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias vim='nvim'
