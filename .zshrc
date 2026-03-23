export LANG=en_US.utf8
export PATH="$PATH:$HOME/.local/scripts/"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="fishy"
plugins=(zsh-autosuggestions)

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
eval "$(zoxide init zsh)"

bindkey -s '^Y' 'tmux-sessionizer\n'
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

source $ZSH/oh-my-zsh.sh
