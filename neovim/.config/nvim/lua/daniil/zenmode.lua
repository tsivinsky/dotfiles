local zenmode = {
  enabled = false,
}

function zenmode.enable()
  vim.opt.number = false
  vim.opt.relativenumber = false
  vim.opt.showtabline = 0
  require("lualine").hide()
  vim.diagnostic.disable()

  zenmode.enabled = true
end

function zenmode.disable()
  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.opt.showtabline = 2
  require("lualine").hide({ unhide = true })
  vim.diagnostic.enable()

  zenmode.enabled = false
end

function zenmode.toggle()
  if zenmode.enabled then
    zenmode.disable()
  else
    zenmode.enable()
  end
end

return zenmode
