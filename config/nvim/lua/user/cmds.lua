function open_terminal(vertically)
  vertically = vertically or false

  if vertically then
    vim.cmd(":vs term://bash")
  else
    vim.cmd(":split term://bash")
  end
end
