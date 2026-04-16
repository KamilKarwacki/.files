if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias vim nvim
alias vimdiff 'nvim -d'
alias sl ls
alias gits 'git status --ignore-submodules'

fish_vi_key_bindings

if set -q IS_CODER
    set -gx PATH $PATH $HOME/.config/coderv2/dotfiles/scripts
    source $HOME/.local/bin/env.fish
else
    set -gx PATH $PATH $HOME/software/nvim/bin
    set -gx PATH $PATH $HOME/software/Odin
    set -gx PATH $PATH $HOME/software/zig
    set -gx PATH $PATH $HOME/software/FlameGraph
    set -gx PATH $PATH $HOME/scripts/
    set -gx PATH $PATH /home/kamil/fun/compilers/llvm-project/build/bin
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv | source)
end
