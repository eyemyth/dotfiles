-- local status_ok, indent_blankline = pcall(require, "indent_blankline")
-- if not status_ok then
--     return
-- end
--
-- vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
-- vim.g.indent_blankline_filetype_exclude = {
--     "help",
--     "startify",
--     "dashboard",
--     "packer",
--     "neogitstatus",
--     "NvimTree",
--     "Trouble",
-- }
-- vim.g.indentLine_enabled = 1
-- vim.g.indent_blankline_context_patterns = {
--     "class",
--     "return",
--     "function",
--     "method",
--     "^if",
--     "^while",
--     "jsx_element",
--     "^for",
--     "^object",
--     "^table",
--     "block",
--     "arguments",
--     "if_statement",
--     "else_clause",
--     "jsx_element",
--     "jsx_self_closing_element",
--     "try_statement",
--     "catch_clause",
--     "import_statement",
--     "operation_type",
-- }
--
-- -- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
-- vim.wo.colorcolumn = "99999"
--
-- indent_blankline.setup({
--     char = "¦",
--     space_char_blankline = " ",
--     show_current_context = true,
--     show_first_indent_level = false,
--     show_trailing_blankline_indent = false,
--     use_treesitter = false,
--     show_current_context_start = true,
--     show_end_of_line = true,
-- })



local status_ok, indent_blankline = pcall(require, "ibl")
if not status_ok then
    return
end

-- require("ibl").setup()

-- local highlight = {
--     "CursorColumn",
--     "Whitespace",
-- }

local highlight = { "Whitespace", "NonText" }

require("ibl").setup {
    indent = { highlight = highlight, char = "▏" },
    whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
    },
    scope = {
        enabled = true,
        show_end = false,
    },
}
