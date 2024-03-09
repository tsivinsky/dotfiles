vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.guicursor = "a:blinkoff0"
vim.opt.mouse = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.signcolumn = "yes"
vim.opt.laststatus = 3
vim.opt.cmdheight = 0
vim.opt.showcmd = false
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"
vim.opt.autoread = true
vim.opt.colorcolumn = "80"
vim.opt.showtabline = 2
vim.opt.wrap = true
vim.opt.encoding = "utf-8"
vim.opt.updatetime = 300
vim.opt.fillchars:append({ eob = " " })
vim.opt.scrolloff = 5
vim.opt.redrawtime = 4000
vim.opt.showmode = false
vim.opt.hidden = true

vim.opt.swapfile = false
vim.opt.writebackup = false

vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.list = true
vim.opt.listchars = { multispace = "·", tab = ">~", leadmultispace = "┊ " }

vim.opt.spelllang = "en_us,ru"

vim.cmd.colorscheme("retrobox")
