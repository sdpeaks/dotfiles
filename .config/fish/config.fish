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
alias ps procs
alias c clear
alias v lvim
alias tree "eza --tree"
alias zll zellij
alias md mkdir
alias py python
alias lg lazygit
alias gtree "git log --graph --oneline --decorate --all"
alias pg "sudo su postgres"
alias docker podman
alias fsi "dotnet fsi"
alias n nvim

zoxide init fish | source

# PATH
set --export PATH $HOME/.bun/bin $PATH
set --export PATH $HOME/go/bin $PATH
set --export PATH $HOME/.dotnet/tools $PATH
set --export PATH /opt/nvim/ $PATH
set --export PATH $HOME/.nimble/bin/ $PATH


starship init fish | source


# yazi navigation
function ya
    set tmp (mktemp -t "yazi-cwd.XXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end


# pnpm
set -gx PNPM_HOME "/home/sduarte/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
