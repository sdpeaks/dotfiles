if status is-interactive
    # Commands to run in interactive sessions can go here
end


function fish_prompt

  function formatted_prompt_pwd
    set -l home ~
    set -l pwd (string replace --regex "$home" '~' $PWD)
    echo (prompt_pwd --full-length-dirs 1)| string replace --regex --all '/' '/'
  end
  
  set -l git_info (fish_git_prompt)
  echo (set_color yellow)""(set_color green)(formatted_prompt_pwd)(set_color blue)$git_info(set_color yellow) (basename "$VIRTUAL_ENV") 
  echo (set_color yellow)"\$ "
end

function fish_right_prompt

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
