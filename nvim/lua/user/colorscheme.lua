vim.cmd [[
try
  colorscheme solarized-high
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
