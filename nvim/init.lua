-- ~/.config/nvim/init.lua
-- One file, top to bottom: options -> safety nets -> plugins -> keys.
-- Plugins are managed by Neovim itself (vim.pack). Update them with :lua vim.pack.update()

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.loaded_netrw = 1 -- nvim-tree is the file browser
vim.g.loaded_netrwPlugin = 1

local state = vim.fn.stdpath('state')

----------------------------------------------------------------------------
-- Options
----------------------------------------------------------------------------
local o = vim.opt
o.number = true
o.relativenumber = true
o.cursorline = true
o.signcolumn = 'yes' -- diagnostic markers live here; 'yes' stops the text jumping
o.scrolloff = 10
o.mouse = 'a'
o.clipboard = 'unnamedplus'
o.termguicolors = true
o.title = true
o.showmode = false -- the statusline shows it
o.shortmess:append('I') -- no intro screen. (Deliberately NOT 'A': that hides the swap-file recovery prompt)

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.smartindent = true
o.breakindent = true

o.ignorecase = true
o.smartcase = true
o.inccommand = 'split' -- live preview of :s/old/new/ while you type it
o.splitright = true
o.splitbelow = true
o.timeoutlen = 300
o.updatetime = 250 -- swap file is written after 250ms idle

o.list = true
o.listchars = { tab = '| ', trail = '·' }

-- Pressing Enter/o on a comment line does not auto-continue the comment
vim.api.nvim_create_autocmd('FileType', {
  callback = function() vim.opt_local.formatoptions:remove({ 'r', 'o' }) end,
})

----------------------------------------------------------------------------
-- Never lose anything
----------------------------------------------------------------------------
-- swap: crash recovery of unsaved edits | undo: history survives closing
-- backup: previous version of a file when you :w over it
for _, dir in ipairs({ 'swap', 'undo', 'backup', 'unsaved', 'sessions' }) do
  vim.fn.mkdir(state .. '/' .. dir, 'p')
end
o.swapfile = true
o.directory = state .. '/swap//'
o.undofile = true
o.undodir = state .. '/undo//'
o.backup = true
o.writebackup = true
o.backupdir = state .. '/backup//'
o.backupext = '.bak'
o.backupskip = { '*.tmp', '*.bak' }
o.shada = "!,h,'1000,<1000,s128,/1000,:1000,@1000"

-- Swap files don't survive a :q!, and scratch ([No Name]) buffers have no file
-- at all. So any buffer with unsaved changes is also copied into
-- ~/.local/state/nvim/unsaved/ whenever you pause typing, leave the buffer, lose
-- focus or quit (including :q!). The copy is removed once the file is saved.
-- Browse them with <leader>su.
local unsaved_dir = state .. '/unsaved'
local run_id = os.date('%Y%m%d-%H%M%S')

local function stash(buf)
  if not vim.api.nvim_buf_is_valid(buf) or not vim.api.nvim_buf_is_loaded(buf) then return end
  if vim.bo[buf].buftype ~= '' then return end
  local name = vim.api.nvim_buf_get_name(buf)
  local path
  if name == '' then
    path = ('%s/%s-scratch%d.txt'):format(unsaved_dir, run_id, buf)
  else
    path = ('%s/%s-%s'):format(unsaved_dir, run_id, (name:gsub('[/:]', '%%')):sub(-150))
  end
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  local empty_scratch = name == '' and #lines == 1 and lines[1] == ''
  if empty_scratch or (name ~= '' and not vim.bo[buf].modified) then
    vim.uv.fs_unlink(path) -- nothing unsaved (saved, reverted, or emptied)
  elseif vim.api.nvim_buf_line_count(buf) <= 100000 then
    vim.fn.writefile(lines, path)
  end
end

local stash_group = vim.api.nvim_create_augroup('stash-unsaved', { clear = true })
vim.api.nvim_create_autocmd(
  { 'TextChanged', 'CursorHold', 'CursorHoldI', 'InsertLeave', 'BufLeave', 'FocusLost', 'BufWritePost' },
  { group = stash_group, callback = function(ev) stash(ev.buf) end }
)
vim.api.nvim_create_autocmd('VimLeavePre', {
  group = stash_group,
  callback = function()
    for _, b in ipairs(vim.api.nvim_list_bufs()) do stash(b) end
  end,
})

-- Drop stashes older than 30 days
for name, kind in vim.fs.dir(unsaved_dir) do
  local p = unsaved_dir .. '/' .. name
  local st = vim.uv.fs_stat(p)
  if kind == 'file' and st and os.time() - st.mtime.sec > 30 * 86400 then vim.uv.fs_unlink(p) end
end

-- Reopen where you were: files and cursor positions, per directory.
-- Only restores when you start nvim with no file arguments.
o.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize', 'folds' }
local function session_file()
  return state .. '/sessions/' .. vim.fn.getcwd():gsub('[/:]', '%%') .. '.vim'
end

vim.api.nvim_create_autocmd('VimLeavePre', {
  callback = function()
    local has_file = false
    for _, b in ipairs(vim.api.nvim_list_bufs()) do
      if vim.bo[b].buflisted and vim.api.nvim_buf_get_name(b) ~= '' and vim.bo[b].buftype == '' then
        has_file = true
      end
    end
    if not has_file then return end
    pcall(function() require('nvim-tree.api').tree.close() end)
    vim.cmd('mksession! ' .. vim.fn.fnameescape(session_file()))
  end,
})

vim.api.nvim_create_autocmd('VimEnter', {
  nested = true,
  callback = function()
    if vim.fn.argc() == 0 and vim.fn.filereadable(session_file()) == 1 then
      vim.cmd('silent! source ' .. vim.fn.fnameescape(session_file()))
    end
  end,
})

-- Jump to the last cursor position when reopening a file
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function(ev)
    local mark = vim.api.nvim_buf_get_mark(ev.buf, '"')
    if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(ev.buf) then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Flash the text you yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.hl.on_yank() end,
})

----------------------------------------------------------------------------
-- Plugins
----------------------------------------------------------------------------
local gh = function(repo) return 'https://github.com/' .. repo end

vim.pack.add({
  gh('folke/tokyonight.nvim'),
  gh('nvim-treesitter/nvim-treesitter'), -- parsers; highlighting itself is built into nvim
  gh('nvim-tree/nvim-tree.lua'), -- file tree
  gh('ibhagwan/fzf-lua'), -- fuzzy finder
  gh('nvim-tree/nvim-web-devicons'), -- icons
  gh('MagicDuck/grug-far.nvim'), -- search & replace across files
  gh('echasnovski/mini.pairs'), -- auto-close brackets and quotes
  gh('folke/which-key.nvim'), -- shows available keys after <leader>
  gh('neovim/nvim-lspconfig'), -- only supplies per-server settings; LSP itself is built in
}, { confirm = false })

-- Colors: follows the terminal's dark/light mode (night / day)
require('tokyonight').setup({ style = 'night', light_style = 'day' })
vim.cmd.colorscheme('tokyonight')

require('nvim-web-devicons').setup()
require('mini.pairs').setup()
require('grug-far').setup({})

require('which-key').setup({ delay = 300, preset = 'helix' })
require('which-key').add({ { '<leader>s', group = 'search' } })

-- File tree (left sidebar)
require('nvim-tree').setup({
  view = { width = 35 },
  filters = { dotfiles = false },
  git = { ignore = false },
  renderer = { group_empty = true },
})

-- Fuzzy finder: everything under the current directory, files AND folders, dotfiles included
require('fzf-lua').setup({
  files = {
    cmd = 'fd --color=never --hidden --follow --exclude .git',
  },
})

----------------------------------------------------------------------------
-- Treesitter: highlighting, with parsers installed automatically on first use
----------------------------------------------------------------------------
local ts = require('nvim-treesitter')
ts.setup()
vim.api.nvim_create_autocmd('FileType', {
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    if not lang then return end
    if pcall(vim.treesitter.start, ev.buf, lang) then return end
    if vim.tbl_contains(ts.get_available(), lang) then
      ts.install(lang):await(function()
        vim.schedule(function()
          if vim.api.nvim_buf_is_valid(ev.buf) then pcall(vim.treesitter.start, ev.buf, lang) end
        end)
      end)
    end
  end,
})

----------------------------------------------------------------------------
-- LSP: diagnostics only (no completion, no formatting, no linting)
-- Servers are installed with brew/npm and just need to be on your PATH.
----------------------------------------------------------------------------
vim.lsp.config('lua_ls', {
  -- lua_ls reports nothing without a workspace, so a lone file (no repo) uses its own folder
  root_dir = function(bufnr, on_dir)
    local file = vim.api.nvim_buf_get_name(bufnr)
    local root = vim.fs.root(file, { '.luarc.json', '.luarc.jsonc', '.git' }) or vim.fs.dirname(file)
    if root ~= vim.env.HOME and root ~= '/' then on_dir(root) end
  end,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      workspace = { library = { vim.env.VIMRUNTIME }, checkThirdParty = false },
      diagnostics = { globals = { 'vim' } },
    },
  },
})
vim.lsp.enable({ 'lua_ls', 'bashls', 'jsonls', 'yamlls', 'taplo', 'fish_lsp' })

-- Quiet markers: a sign in the gutter, underline, message on demand (<leader>d)
vim.diagnostic.config({
  virtual_text = false,
  underline = true,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '',
    },
  },
  float = { border = 'rounded', source = true },
})

----------------------------------------------------------------------------
-- Statusline: mode, file, modified flag ... diagnostics, line:column
----------------------------------------------------------------------------
function _G.StatusDiagnostics()
  local c = vim.diagnostic.count(0)
  local parts = {}
  local S = vim.diagnostic.severity
  if (c[S.ERROR] or 0) > 0 then parts[#parts + 1] = ' ' .. c[S.ERROR] end
  if (c[S.WARN] or 0) > 0 then parts[#parts + 1] = ' ' .. c[S.WARN] end
  return table.concat(parts, ' ')
end
o.laststatus = 2
o.statusline = ' %f %m%r%=%{v:lua.StatusDiagnostics()}  %l:%c '

----------------------------------------------------------------------------
-- Keys
----------------------------------------------------------------------------
local map = vim.keymap.set
local fzf = function(fn, opts)
  return function() require('fzf-lua')[fn](opts) end
end

map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- The two main ones
map('n', '<leader>e', function() require('nvim-tree.api').tree.toggle({ find_file = true }) end, { desc = 'File tree' })
map('n', '<leader><leader>', fzf('files'), { desc = 'Find file or folder' })

-- Search
map('n', '<leader>/', fzf('blines'), { desc = 'Search in this file' })
map('n', '<leader>sg', fzf('live_grep'), { desc = 'Grep all files' })
map('n', '<leader>s.', fzf('oldfiles'), { desc = 'Recent files' })
map('n', '<leader>sn', fzf('files', { cwd = vim.fn.stdpath('config') }), { desc = 'Neovim config files' })
map('n', '<leader>sr', function() require('grug-far').open() end, { desc = 'Search & replace' })
map('n', '<leader>su', fzf('files', { cwd = unsaved_dir, cmd = 'ls -t' }), { desc = 'Recover unsaved changes' })

-- Misc
map('n', '<leader>ev', '<cmd>e $MYVIMRC<CR>', { desc = 'Edit init.lua' })
map('n', '<leader>q', '<cmd>e ~/todo.txt<CR>', { desc = 'Open ~/todo.txt' })
map('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic' })

-- Windows
map('n', 'vv', '<C-w>v', { desc = 'Split vertical' })
map('n', 'ss', '<C-w>s', { desc = 'Split horizontal' })
map('n', '<C-h>', '<C-w><C-h>')
map('n', '<C-j>', '<C-w><C-j>')
map('n', '<C-k>', '<C-w><C-k>')
map('n', '<C-l>', '<C-w><C-l>')
