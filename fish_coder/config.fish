if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias vim nvim
alias vimdiff 'nvim -d'
alias sl ls
alias gits 'git status --ignore-submodules'

set -gx PATH $PATH $HOME/.config/coderv2/dotfiles/scripts
source $HOME/.local/bin/env.fish

fish_vi_key_bindings
