--: helpers {{{
--: https://github.com/nvim-telescope/telescope.nvim/issues/1923 {{{
function vim.getVisualSelection()
    vim.cmd('noau normal! "vy"')
    local text = tostring(vim.fn.getreg("v"))
    vim.fn.setreg("v", {})

    text = string.gsub(text, "\n", "")
    if #text > 0 then
        return text
    else
        return ""
    end
end
--: }}}

--: default keymaps options {{{
local opts = { noremap = true, silent = true }
--: }}}

--: Shorten key mappings function names {{{
local keymap = function(mode, keys, cmd, options)
    options = options or {}
    options = vim.tbl_deep_extend("force", opts, options)
    vim.api.nvim_set_keymap(mode, keys, cmd, options)
end

local keyset = function(modes, keys, cmd, options)
    options = options or {}
    options = vim.tbl_deep_extend("force", opts, options)
    vim.keymap.set(modes, keys, cmd, options)
end
--: }}}

--: Remap space as leader key {{{
-- keymap("", "<Space>", "<Nop>")
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "
--: }}}

--: Press jk fast to enter {{{
keymap("i", "jk", "<ESC>")
--: }}}

--: esc with c-g {{{
keyset("v", "<C-g>", "<ESC>")
--: }}}

--: Move around while in insert mode {{{
-- keymap("i", "<C-a>", "<C-O>0")
keymap("i", "<C-a>", "<Home>")
-- keymap("i", "<C-e>", "<C-O>$")
keymap("i", "<C-e>", "<End>")
keymap("i", "<C-b>", "<Left>")
keymap("i", "<A-b>", "<ESC>bi")
keymap("i", "<C-f>", "<Right>")
keymap("i", "<A-f>", "<ESC>lwi")
--: }}}

--: move around cursor center and top {{{
keyset("n", "<C-z>", "zz", { desc = "Center around cursor" })
keyset("i", "<C-z>", "<C-O>zz", { desc = "Center around cursor" })
keymap("i", "<C-t>", "<C-O>zt")
keymap("n", "<C-t>", "zt", { desc = "Top current line" })
--: }}}

--: Move up and down with wrapped lines {{{
keymap("n", "j", "gj")
keymap("n", "k", "gk")
--: }}}

--: new line above {{{
-- "<C-o>O" is equivalent to "<esc>O" while in insert mode
keyset("i", "<C-O>", "<C-o>O", { desc = "Insert line above" })
--: }}}

--: Quicksave command {{{
keyset("n", "<leader>s", "<cmd>w<CR>", { desc = "Save file" })
keyset("n", "<leader>fs", "<cmd>w<CR>", { desc = "Save file" })
keymap("n", "<Leader>S", "<cmd>w!<CR>", { desc = "Save file override" })
--: }}}

--: Quit current window {{{
keymap("n", "<leader>e", ":quit<CR>", { desc = "Quit" })
keymap("n", "<leader>E", ":q!<CR>", { desc = "Force Quit" })
--: }}}

--: Easy select all of file {{{
keymap("n", ",A", "ggVG<c-$>", { desc = "Select All" })
--: }}}

--: Duplicate line and comment old line out {{{
keymap("n", "gcy", "gcc:t.<cr>gcc", { noremap = false, desc = "Duplicate-comment line" })
--: }}}

--: Switch buffers {{{
-- keymap("n", "<S-w>", ":bnext<CR>")
-- keymap("n", "<S-q>", ":bprevious<CR>")
keymap("n", "ga", ":b#<CR>zz", { desc = "Last buffer" })
--: }}}

--: Using Bbye plugin to close the current buffer {{{
keymap("n", "<leader>q", ":Bdelete<CR>", { desc = "Close (delete) Buffer" })
keymap("n", "<leader>bd", ":Bdelete<CR>", { desc = "Close (delete) Buffer" })
-- wipeout current buffer
keymap("n", "<leader>bw", ":Bwipeout<CR>", { desc = "Wipeout Buffer" })
-- keymap("n", "<leader>bd", ":bd<CR>")
--: }}}

--: Close tab {{{
keymap("n", "<leader>Q", ":tabclose<cr>", { desc = "Close tab" })
--: }}}

--: Move text up and down {{{
keymap("n", "<A-Down>", "]e==", { noremap = false, silent = true })
keymap("n", "<A-Up>", "[e==", { noremap = false, silent = true })
--: }}}

--: search for word under cursor and stays there {{{
-- searches exact word (* forward, # backwards)
keymap("n", "*", "*N", { noremap = true })
keymap("n", "#", "#N", { noremap = true })
-- searches but not the exact word (* forward, # backwards)
keymap("n", "g*", "g*N", { noremap = true, desc = "Search not exact" })
keymap("n", "g#", "g#N", { noremap = true, desc = "BckSearch not exact" })
--: }}}

--: select line without end of line {{{
keymap("n", ",a", "^v$h", { desc = "Select line-no-end" })
keymap("n", "g;", "^v$h", { desc = "Select line-no-end" })
--: }}}

--: paste register for printing (JavaScript) {{{
keymap("n", ",d", 'oconsole.log("<esc>pa")<esc>', { desc = "Paste for printing - JS" })
keymap("n", ",D", 'Oconsole.log("<esc>pa")<esc>', { desc = "Paste for printing - JS" })
--: }}}

--: Paste register for informative printing {{{
keymap("n", ",s", 'a"<esc>pa:", <esc>p', { desc = "Paste for info printing" })
--: }}}

--: keep cursor at same position when joining lines {{{
keymap("n", "J", "mzJ`z")
--: }}}

--: toggle wrapping lines {{{
keymap("n", "<leader>tw", "<cmd>set wrap!<cr>", { desc = "Line wrap" })
--: }}}

--: toggle line numbers {{{
keyset("n", "<leader>tn", function()
    vim.cmd([[
        set invnumber
        set invrelativenumber
    ]])
end, { desc = "Line numbers" })
--: }}}

--: center when scrolling page down and up {{{
keymap("n", "<c-d>", "<c-d>zz")
keymap("n", "<c-u>", "<c-u>zz")
--: }}}

--: center around next search result {{{
keyset("n", "n", "nzzzv")
keyset("n", "N", "Nzzzv")
--: }}}

--: set current file's directory as working directory {{{
keymap("n", "<leader>cd", "<cmd>cd %:p:h<CR>", { desc = "Set directory as wd" })
--: }}}

--: Better window navigation {{{
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")
--: }}}

--: Resize windows with arrows {{{
keymap("n", "<C-Up>", ":resize -2<CR>")
keymap("n", "<C-Down>", ":resize +2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")
--: }}}

--: Clear search highlight {{{
keymap("n", "<leader>,", "<cmd>nohlsearch|diffupdate|normal! <C-L><CR>", { desc = "Clear search highlight" })
keymap("n", "<esc>", "<esc><cmd>noh<cr>", { noremap = true, desc = "No highlight escape" })
--: }}}

--: home row goto end and start of line (same as in Helix editor) {{{
keyset({ "n", "v", "o" }, "gh", "^", { desc = "Go to start of line" })
keyset({ "n", "o" }, "gl", "$", { desc = "Go to end of line" })
keyset("v", "gl", "$h", { desc = "Go to end of line" })
--: }}}

--: Stay in indent mode {{{
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")
--: }}}

--: Comment {{{
-- toggle comment in normal mode
keyset("n", "<C-c>", function()
    return vim.v.count == 0 and "<Plug>(comment_toggle_linewise_current)" or "<Plug>(comment_toggle_linewise_count)"
end, { expr = true })
keyset("n", "<C-b>", "<Plug>(comment_toggle_blockwise_current)")

-- toggle comment using C-/
-- keyset("n", "<C-_>", function()
--     return vim.v.count == 0 and "<Plug>(comment_toggle_linewise_current)" or "<Plug>(comment_toggle_linewise_count)"
-- end, { expr = true })
-- vim.keymap.set("x", "<C-_>", "<Plug>(comment_toggle_linewise_visual)")

-- toggle comment in visual mode
vim.keymap.set("x", "<C-c>", "<Plug>(comment_toggle_linewise_visual)")
vim.keymap.set("x", "<C-b>", "<Plug>(comment_toggle_blockwise_visual)")
--: }}}

--: Duplicate and comment selection {{{
keymap("v", "gy", ":t'><cr>gvgcgv<esc>", { noremap = false, desc = "Duplicate and comment" })
--: }}}

--: Move text up and down {{{
keymap("v", "<A-Down>", ":m .+1<CR>==")
keymap("v", "<A-Up>", ":m .-2<CR>==")
keymap("x", "<A-Down>", ":move '>+1<CR>gv=gv")
keymap("x", "<A-Up>", ":move '<-2<CR>gv=gv")
--: }}}

--: paste and replace selection {{{
keymap("v", "p", '"_dP')
--: }}}

--: search for highlighted text {{{
keymap("v", "*", "y/\\V<C-R>=escape(@\",'/')<CR><CR>N", { noremap = true })
--: }}}

--: substitute word previously searched {{{
-- on selection only
keymap("v", "<leader>R", ":s///g<LEFT><LEFT>", { noremap = true, desc = "Replace search" })
-- on entire buffer
keymap("n", "<leader>R", ":%s///g<LEFT><LEFT>", { noremap = true, desc = "Replace search" })
-- substitute current word
keyset("n", "<leader>X", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Substitute current word" })
keyset("v", "<leader>X", [[y:%s/<C-r>0/<C-r>0/gI<Left><Left><Left>]], { desc = "Substitute selection" })
--: }}}

--: Explorer (netrw) {{{
keymap("n", "<leader>oe", ":Explor<cr>", { desc = "Netrw" })
--: }}}

--: Replace the easy-clip plugin {{{
-- keymap("x", "<leader>p", '"_dP')
keyset({ "n", "v", "o" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })
keyset({ "n", "v", "o" }, "<leader>P", '"+P', { desc = "Paste from clipboard" })
keyset({ "n", "v", "o" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
keymap("n", "<leader>Y", '"+Y', { noremap = false, desc = "Yank to clipboard line-end" })
keymap("n", "d", '"_d')
keymap("n", "D", '"_D')
keymap("v", "d", '"_d')
keymap("", "s", "h")
keymap("", "f", "l")
keyset("n", "gm", "m")
keymap("", "m", "d")
keymap("", "<leader>m", '"+d', { desc = "Cut to clipboard" })
keymap("n", "x", '"_x')
keymap("n", "X", '"_X')
keymap("n", "c", '"_c')
keymap("n", "C", '"_C')
keymap("v", "x", '"_x')
keymap("v", "c", '"_c')
--: }}}

--: Other mappings {{{
keyset("n", "<leader>ol", "<cmd>:Lazy<cr>", { desc = "Lazy Dashboard" })
--: }}}

--: toggle Colemak DH(m) layout keybindings {{{
vim.api.nvim_create_user_command("ColemakToggle", function()
    if not colemak then
        keymap("i", "ne", "<ESC>")
        keymap("", "n", "j")
        keymap("", "e", "k")
        keymap("n", "N", "J")
        keyset({ "n", "o" }, "i", "l")
        keymap("n", "I", "L")
        keymap("", "j", "e")
        keymap("n", "J", "E")
        keymap("n", "k", "n")
        keymap("n", "K", "N")
        keyset({ "n", "o" }, "l", "i")
        keymap("n", "L", "I")
        keymap("", "m", "h")
        keymap("", "h", "d")
        keymap("", "t", "l")
        keymap("", "gm", "^", { desc = "Go to start of line" })
        keyset({ "n", "o" }, "gi", "$", { desc = "Go to end of line" })
        keymap("v", "gi", "$h", { desc = "Go to end of line" })
        keyset("n", "gl", "`^i", { desc = "Move to the last insertion" })
        _G.colemak = true
    else
        keymap("i", "jk", "<ESC>")
        keymap("", "n", "n")
        keymap("", "e", "e")
        keymap("n", "N", "N")
        keyset({ "n", "o" }, "i", "i")
        keymap("n", "I", "I")
        keymap("n", "j", "j")
        keymap("n", "J", "J")
        keymap("n", "k", "k")
        keymap("n", "K", "K")
        keyset({ "n", "o" }, "l", "l")
        keymap("n", "L", "L")
        keymap("", "m", "d")
        keymap("", "h", "h")
        keymap("", "t", "t")
        keymap("v", "gl", "$h", { desc = "Go to end of line" })
        keyset({ "n", "o" }, "gl", "$", { desc = "Go to end of line" })
        keymap("n", "gi", "`^i", { desc = "Move to the last insertion" })
        _G.colemak = false
    end
    vim.cmd("redrawstatus!")
end, {})
keymap("n", "<leader>tC", ":ColemakToggle<cr>", { desc = "Colemak Layout" })

--: }}}

local M = {}
M.keymap = keymap
M.keyset = keyset
return M
