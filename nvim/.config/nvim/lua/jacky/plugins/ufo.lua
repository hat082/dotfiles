return {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  config = function()
    local ufo = require("ufo")
    vim.o.foldcolumn = '0' -- '0' is not bad
    vim.o.nofoldenable = true
    vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
    vim.keymap.set('n', 'zr', ufo.openAllFolds, { desc = "Ufo open all folds" })
    vim.keymap.set('n', 'zm', ufo.closeAllFolds, { desc = "Ufo close all folds" })

    vim.keymap.set('n', 'zk', function()
      local winid
      ufo.peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end, { desc = "Ufo Peek Fold" })

    ufo.setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
      end
    })
    --
  end
}
