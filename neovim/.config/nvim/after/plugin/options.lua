local opt = vim.opt

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
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.wrap = true
opt.swapfile = false
opt.hidden = true
opt.writebackup = false
opt.encoding = "utf-8"
opt.updatetime = 300
opt.mouse = ""
opt.cursorline = true
opt.clipboard = "unnamedplus"
opt.signcolumn = "yes"
opt.fillchars:append({ eob = " " })
opt.showtabline = 2
opt.showcmd = false
opt.guicursor = "a:block,i:ver25"
opt.fileformat = "unix"
opt.fileformats = { "unix", "dos", "mac" }
opt.laststatus = 3
opt.cmdheight = 0
opt.smartcase = true
opt.ignorecase = true
opt.scrolloff = 5
opt.colorcolumn = "120"
opt.autoread = true
opt.showmode = false
opt.redrawtime = 4000
opt.list = true
opt.listchars = { multispace = "·", tab = ">~" }
