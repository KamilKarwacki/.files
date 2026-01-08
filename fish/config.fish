if status is-interactive
    # Commands to run in interactive sessions can go here
end

# neovim path
set -x PATH $PATH $HOME/software/nvim/bin

alias vim nvim
alias sl ls

# Rust / Cargo environment
source $HOME/.cargo/env.fish

set -x PATH $PATH $HOME/software/Odin
set -x PATH $PATH $HOME/software/zig
set -x PATH $PATH $HOME/software/FlameGraph
set -x PATH $PATH /home/kamil/fun/compilers/llvm-project/build/bin




