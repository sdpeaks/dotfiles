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
alias ll "eza -lh --icons --no-user --no-filesize --no-time"
alias cat "bat --theme=gruvbox-dark"
alias find fd
alias ps procs
alias c clear
alias v lvim
alias tree "exa --tree"
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

zoxide init fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# go bin
set --export PATH $HOME/go/bin $PATH
