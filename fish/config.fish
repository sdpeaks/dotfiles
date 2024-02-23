if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""
set -x EDITOR nvim
set -x PATH $PATH 

# --------------------
# ALIAS
# --------------------
alias l "eza --icons --grid"
alias ll "eza --long --icons --no-user --no-time --group-directories-first"
alias cat "bat --theme=gruvbox-dark"
alias find fd
alias ps procs
alias c clear
alias v lvim
alias tree "eza --tree"
alias zll zellij
alias md mkdir
alias py python
alias h hx
alias lg lazygit
alias gtree "git log --graph --oneline --decorate --all"
alias pg "sudo su postgres"
alias docker podman
alias fsi "dotnet fsi"
alias n nvim
alias pn pnpm

zoxide init fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# go bin
set --export PATH $HOME/go/bin $PATH

# starship init fish | source


# yazi navigation
function ya
	set tmp (mktemp -t "yazi-cwd.XXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

