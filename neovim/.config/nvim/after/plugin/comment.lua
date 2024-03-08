local U = require("Comment.utils")

local ctype_to_commentstring = {
  [U.ctype.linewise] = "__default",
  [U.ctype.blockwise] = "__multiline",
}

require("Comment").setup({
  pre_hook = function(ctx)
    -- Only calculate commentstring for tsx filetypes
    if vim.bo.filetype == "typescriptreact" or vim.bo.filetype == "javascriptreact" then
      -- Detemine whether to use linewise or blockwise commentstring
      local type = ctype_to_commentstring[ctx.ctype]

      -- Determine the location where to calculate commentstring from
      local location = nil
      if ctx.ctype == U.ctype.block then
        location = require("ts_context_commentstring.utils").get_cursor_location()
      elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
        location = require("ts_context_commentstring.utils").get_visual_start_location()
      end

      return require("ts_context_commentstring.internal").calculate_commentstring({
        key = type,
        location = location,
      })
    end
  end,
})
