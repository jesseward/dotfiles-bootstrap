vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>")

-- split windows
keymap.set("n", "<leader>sv", "<C-w>v") -- split a new vertical window
keymap.set("n", "<leader>sh", "<C-w>s") -- split a new horizontal window
keymap.set("n", "<leader>se", "<C-w>=") -- restore to default sizes
keymap.set("n", "<leader>sx", ":close<CR>") -- close the split

-- tab controls
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open a new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- move to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- move to previous tab

keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

local builtin = require('telescope.builtin')
keymap.set('n', '<leader>ff', builtin.find_files, {}) -- file finder
keymap.set('n', '<leader>fg', builtin.live_grep, {})
keymap.set('n', '<leader>fb', builtin.buffers, {})
keymap.set('n', '<leader>fh', builtin.help_tags, {})

keymap.set('n', '<leader>fl', ":lua vim.lsp.buf.format { async = true }<CR>") -- format lua file

-- debugger / dap shortcutss.
keymap.set('n', '<leader>db', ":lua require'dap'.toggle_breakpoint()<CR>") -- set a breakpoint
keymap.set('n', '<leader>du', ":lua require'dapui'.toggle()<CR>") -- toggle the dap-ui
keymap.set('n', '<leader>dt', ":lua require'dap-go'.debug_test()<CR>") -- debug current test
keymap.set('n', '<leader>dlt', ":lua require'dap-go'.debug_last_test()<CR>") -- debug last/rerun test
keymap.set('n', '<leader>dc', ":lua require'dap'.continue()<CR>") -- debug last/rerun test
