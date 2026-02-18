if status is-interactive
# Commands to run in interactive sessions can go here
    set -g fish_greeting
end

set -gx EDITOR nvim

alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

set -gx ROCM_PATH /opt/rocm
set -gx HIP_PLATFORM amd
fish_add_path $ROCM_PATH/bin

zoxide init fish | source
