local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = true,
    sources = {
        formatting.prettier.with({
            filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "jsonc", "markdown", "graphql", "handlebars" }
        }),
        formatting.black,
        formatting.isort,
        formatting.stylua.with({ extra_args = { "--config-path ~/.config/stylua.toml" } }),
        formatting.stylelint,
        formatting.trim_whitespace,
        formatting.phpcsfixer,
        formatting.rustfmt,
        diagnostics.php,
    },
    on_attach = function(client)
        if client.supports_method("textDocument/formatting") then
            vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
        end
    end,
})
