export LANG=en_US.utf8
export EDITOR=nvim
export PATH="$PATH:$HOME/.local/scripts/"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export ROCM_PATH=/opt/rocm
export HIP_PATH=/opt/rocm
export DEVICE_LIB_PATH=/opt/rocm/lib/bitcode
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="fishy"
plugins=(zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    command yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}

eval "$(zoxide init zsh)"
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

bindkey -s '^F' 'tmux-sessionizer\n'
bindkey '^Y' autosuggest-accept
export ACPP_CLANG=/opt/rocm/llvm/bin/clang++
