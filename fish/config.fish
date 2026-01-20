if status is-interactive
    # Commands to run in interactive sessions can go here
end

# neovim path
set -x PATH $PATH $HOME/software/nvim/bin

alias vim nvim
alias sl ls
alias gits "git status" 

set -x PATH $PATH $HOME/software/Odin
set -x PATH $PATH $HOME/software/zig
set -x PATH $PATH $HOME/software/FlameGraph
set -x PATH $PATH $HOME/scripts/
set -x PATH $PATH /home/kamil/fun/compilers/llvm-project/build/bin

eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv | source)

fish_vi_key_bindings
