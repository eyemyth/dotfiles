local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "-", ":vertical resize -2<CR>", opts)
keymap("n", "+", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<right>", ":bnext<CR>", opts)
keymap("n", "<left>", ":bprevious<CR>", opts)

-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Quickly make vsplits
keymap("n", "<Leader>v", ":vnew<CR>", opts)

-- System clipboard shortcuts
keymap("n", "<leader><leader>y", "+y<CR>", opts)
keymap("n", "<leader><leader>yy", ':norm ^"+y$<CR>', opts)
keymap("n", "<leader><leader>p", ":put<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Easier/better ^/$
_G.FirstCharOrFirstCol = function()
    local current_col = vim.fn.virtcol(".")
    vim.cmd("normal ^")
    local first_col = vim.fn.virtcol(".")
    if current_col <= first_col then
        vim.cmd("normal 0")
    end
end

keymap("", "L", "$", opts)
keymap("", "H", ":lua FirstCharOrFirstCol()<CR>", opts)

-- Delete buffer without closing split
keymap("n", "<leader>z", ":BD<CR>", opts)

-- Telescope
keymap("n", "<C-P>", "<cmd>lua require('telescope.builtin').git_files()<cr>", opts)
keymap("n", "<C-T>", "<cmd>lua require('telescope.builtin').tags()<cr>", opts)

-- LSP
keymap("n", "gd", "v:lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gr", "v:lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "K", "v:lua vim.lsp.buf.hover()<CR>", opts)

-- Trouble
-- vim.lsp.buf.formatting()
-- v:lua trouble.next({skip_groups = true, jump = true})<CR>
-- _G.next_error = function()
--     require("trouble").next({skip_groups = true, jump = true});
-- end
--
-- keymap("n", "<leader>a", "<cmd>lua next_error()<CR>", opts)
keymap("n", "<leader>a", "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<CR>", opts)
-- keymap("n", "<Leader>a", ":lua next_error()<CR>", opts)

-- Move text up and down
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
--
--
--
-- Remove all trailing whitespace
-- https://github.com/cappyzawa/trim.nvim
-- keymap("n", "<leader>w", ":let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>", opts)
