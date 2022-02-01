local opt = vim.opt
local wo = vim.wo

-- 2 tabs converted to spaces + autoindentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- What the **** is this
opt.shortmess = "filnxtToOFc"

-- Create splits like a normal human being
opt.splitbelow = true
opt.splitright = true

-- Other settings
opt.number = true
opt.relativenumber = true
opt.wrap = true
opt.swapfile = false
opt.hidden = true
opt.writebackup = false
opt.encoding = "utf-8"
opt.updatetime = 300
opt.mouse = "a"
opt.cursorline = true
opt.clipboard = "unnamedplus"
opt.signcolumn = "yes"
opt.fillchars:append({ eob = " " })
opt.showtabline = 2
opt.matchpairs:append({ "<:>" })

-- Settings for folds
-- wo.foldmethod = "expr"
-- wo.foldexpr = "nvim_treesitter#foldexpr()"
-- wo.foldcolumn = "3"
-- wo.foldenable = false
