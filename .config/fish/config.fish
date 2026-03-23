if status is-interactive
# Commands to run in interactive sessions can go here
    set -g fish_greeting
end

alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

bind ctrl-y tmux-sessionizer
bind ctrl-f accept-autosuggestion

alias clang++="clang++ -std=c++23 -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -pedantic-errors -Werror"

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

set -gx EDITOR nvim
set -gx ROCM_PATH /opt/rocm
set -gx HIP_PLATFORM amd
set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

fish_add_path $ROCM_PATH/bin

zoxide init fish | source
