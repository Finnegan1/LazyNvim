return {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    require("harpoon").setup({})

    vim.keymap.set('n','<leader>ha',function() require("harpoon.mark").add_file() end, {desc='Add File'})
    vim.keymap.set('n','<leader>hv',function() require("harpoon.ui").toggle_quick_menu() end, {desc='View Menu'})

    vim.keymap.set('n','<leader>h1',function() require("harpoon.ui").nav_file(1) end, {desc='First File'})
    vim.keymap.set('n','<leader>h2',function() require("harpoon.ui").nav_file(2) end, {desc='Second File'})
    vim.keymap.set('n','<leader>h3',function() require("harpoon.ui").nav_file(3) end, {desc='Third File'})
    vim.keymap.set('n','<leader>h4',function() require("harpoon.ui").nav_file(4) end, {desc='Fourth File'})
    vim.keymap.set('n','<leader>h5',function() require("harpoon.ui").nav_file(5) end, {desc='Fifth File'})
    vim.keymap.set('n','<leader>h6',function() require("harpoon.ui").nav_file(6) end, {desc='Sixth File'})
    vim.keymap.set('n','<leader>h7',function() require("harpoon.ui").nav_file(7) end, {desc='Seventh File'})
    vim.keymap.set('n','<leader>h8',function() require("harpoon.ui").nav_file(8) end, {desc='Eighth File'})
    vim.keymap.set('n','<leader>h9',function() require("harpoon.ui").nav_file(9) end, {desc='Ninth File'})

    vim.keymap.set('n','<leader>hj',function() require("harpoon.ui").nav_next() end, {desc='Navigate to next'})
    vim.keymap.set('n','<leader>hk',function() require("harpoon.ui").nav_prev() end, {desc='Navigate to next'})

    vim.keymap.set('n','<leader>ht1',function() require("harpoon.term").gotoTerminal(1) end, {desc='GoTo Terminal One'})
    vim.keymap.set('n','<leader>ht2',function() require("harpoon.term").gotoTerminal(2) end, {desc='GoTo Terminal Two'})
    vim.keymap.set('n','<leader>ht3',function() require("harpoon.term").gotoTerminal(3) end, {desc='GoTo Terminal Three'})
  end
}
