layout next
set print elements 0
set auto-load safe-path

# when debugging a python wrapper that calls another thing under the hood 
set follow-fork-mode child
set detach-on-fork off

set substitute-path external/llvm-project /home/KamilKarwacki/roof-mlir/third-party/llvm-project
set substitute-path external/iree /home/KamilKarwacki/roof-mlir/third-party/iree
set substitute-path external/torch-mlir /home/KamilKarwacki/roof-mlir/third-party/torch-mlir
set substitute-path external/cpuinfo /home/KamilKarwacki/roof-mlir/third-party/iree/third_party/cpuinfo
set substitute-path bazel-out /home/KamilKarwacki/roof-mlir/bazel-out
set substitute-path /proc/self/cwd/external/llvm-project /home/KamilKarwacki/roof-mlir/third-party/llvm-project
set substitute-path /proc/self/cwd/external/iree /home/KamilKarwacki/roof-mlir/third-party/iree
set substitute-path external/patio /home/KamilKarwacki/roof-mlir/plugins/compiler
set substitute-path /proc/self/cwd/external/patio /home/KamilKarwacki/roof-mlir/plugins/compiler

define bsave
    shell rm -f brestore.txt
    set logging file brestore.txt
    set logging on
    info break
    set logging off
    # Reformat on-the-fly to a valid GDB command file
    shell perl -n -e 'print "break $1\n" if /^\d+.+?(\S+)$/g' brestore.txt > brestore.gdb
end
document bsave
  store actual breakpoints
end

define brestore
  source brestore.gdb
end
document brestore
  restore breakpoints saved by bsave
end
