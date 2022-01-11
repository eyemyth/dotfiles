local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.lsp-installer"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
require "user.lsp.python"
require "user.lsp.bash"
require "user.lsp.docker"
require "user.lsp.eslint"
require "user.lsp.html"
require "user.lsp.rust"
require "user.lsp.sqlls"
require "user.lsp.tsserver"
