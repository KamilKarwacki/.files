local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.odin= {
  install_info = {
    url = "~/software/tree-sitter-odin", -- local path or git repo
    files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = true, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
  },
  filetype = "odin", -- if filetype does not match the parser name
}
