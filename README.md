# Ryan's Environment

This repo defines Ryan's terminal environment. It contains:
- a [Neovim](https://github.com/neovim/neovim) environment with tons of plugins and customization
- a [tmux](https://github.com/tmux/tmux/wiki) environment with a few plugins and some customization
- a (simple by today's standard) bash environment
- a collection of scripts to help with random things
- a convenient one-line command to install various system dependencies that I always need

### Installation

The following should be done in all cases (i.e. on the host, in docker containers, on remote servers):

**Debian:**
```bash
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/acu192/config-env/main/install_debian.bash | bash
```

**MacOS:**
```bash
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/acu192/config-env/main/install_macos.bash | bash
```

On the host machine, you also need to install the fonts:
```bash
cd fonts/<your-system> && make
```

Also on the host machine, you need to configure your terminal to:
1. use one of those fonts install above,
2. have a reasonable default color palette (e.g. in gnome terminal I use "GNOME dark" as the background and "Solarized" as the palette), and
3. support 24bit color.

### Neovim Custom Keymaps

**My mappings:**
 - My `<leader>` is `,`.
 - `<Space>`: mapped to `:` (and `:` is mapped to _nothing_ so you stop the bad habit)
 - `jj`: mapped to `<Esc>`
 - `<C-s>` or `<leader>s`: Save the buffer.
 - `<C-q>` or `<leader>q`: Close (quit) the window.
 - `<leader>/`: Clear the active search (to un-highlight them).
 - `Q`: Replay the macro stored in the `q` macro. Hint: First use `qq` to record the macro.
 - `<F5>` or `<leader>5`: Toggle spell check (it's ON by default).
 - `<F6>` or `<leader>6`: Toggle word wrap (it's OFF by default).
 - (in visual mode): `J` and `K` move the selected lines up and down.
 - `<leader>G`: Select the entire buffer.

**folke/which-key.nvim:**
 - _upon any hesitation_: Show a little pop-up with suggestions to help you remember what you want.
 - `z=`: Fix spelling with the same little pop-up (rather than the default ugly full-screen behavior).

**numToStr/Comment.nvim:**
 - Normal Mode:
   - `gcc` Toggle the current line using linewise comment.
   - `gbc` Toggle the current line using blockwise comment.
   - `[count]gcc` Toggle the number of line given as a prefix-count using linewise.
   - `[count]gbc` Toggle the number of line given as a prefix-count using blockwise.
   - `gc[count]{motion}` (Op-pending) Toggle the region using linewise comment.
   - `gb[count]{motion}` (Op-pending) Toggle the region using blockwise comment.
 - Visual Mode:
   - `gc` Toggle the region using linewise comment.
   - `gb` Toggle the region using blockwise comment.

**nvim-treesitter/nvim-treesitter:**
 - `<C-space>`: start incremental select & node increment
 - `<C-a>`: node decrement

**lewis6991/gitsigns.nvim:**
 - `<F1>` or `<leader>1`: Go to next git hunk.
 - `<F2>` or `<leader>2`: Go to previous git hunk.
 - `<F3>` or `<leader>3`: Preview this git hunk's diff.
 - `<F4>` or `<leader>4`: Stage this git hunk (also works in visual mode to stage only a certain line(s)).
 - `<leader>B`: Toggle current-line git-blame viewer.

**akinsho/bufferline.nvim:**
 - `<C-w>` or `<leader>w`: Close current buffer (IF SAVED; else ignore command).
 - `<C-b>` or `<leader>b`: Close all other buffers (IF SAVED; else they stay open).
 - `<Shift-Tab>`: Cycle to Previous Buffer
 - `<Tab>`: Cycle to Next Buffer

**nvim-tree/nvim-tree.lua:**
 - Anytime:
   - `<F7>` or `<leader>7`: Close file tree.
   - `<F8>` or `<leader>8`: Open file tree on current buffer's file, and focus it.
   - `<F9>` or `<leader>9`: Collapse all the folders in the file tree.
 - When in File Tree:
   - `<Enter>`: Open file/folder
   - `Double-click`: Open file/folder
   - `o`: Open file/folder
   - `O`: Open file/folder (without asking for which window in the case that there is more than one window)
   - `\`: Open file in vertical split
   - `-`: Open file in horizontal split
   - `<Tab>`: Move focus back to buffers
   - `<BS>`: Close parent folder
   - `{`: Select parent folder
   - `i`: See file info
   - `.`: Run command on current file
   - `a`: Create new file
   - `r`: Rename file
   - `d`: Delete file
   - `c`: Copy file
   - `x`: Cut file
   - `p`: Paste file
   - `M`: Maximize all folders
   - `m`: minimize all folders
   - `b`: Toggle "No Buffer" filter (i.e. hiding all files not currently open)
   - `h`: Toggle hidden files (i.e. files starting with a dot)
   - `g`: Toggle gitignore files
   - `q`: Close the file tree
   - `R`: Refresh file tree
   - `?`: See help dialog

**christoomey/vim-tmux-navigator:**
 - `<C-j>`: Activate the window DOWN.
 - `<C-k>`: Activate the window UP.
 - `<C-h>`: Activate the window LEFT.
 - `<C-l>`: Activate the window RIGHT.
 - `<C-\>`: Activate previous window.

**neovim/nvim-lspconfig:**
 - Things set by nvim's default LSP client ([ref](https://neovim.io/doc/user/lsp.html)):
   - omnifunc ... which is, in insert mode, `C-x + C-o`: LSP-powered autocomplete
   - tagfunc ... which is:
     - `C-]`: jump to definition (LSP-powered)
     - `C-w + ]`: split current window and go to definition in the new split (doesn't work since we use C-w elsewhere)
     - `C-w + }`: make a preview window with the results of `:ptag` (doesn't work since we use C-w elsewhere)
   - formatexpr ... which autoformats lines with `gq` (LSP-powered)
   - `K` which looks up documentation (via the LSP) for the word under the cursor
 - Things I set myself (mostly copied from the suggestions of [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig#suggested-configuration)):
   - `<leader>d`: [DIAGNOSTICS] Open floating diagnostics window
   - `[d`: [DIAGNOSTICS] Goto previous diagnostic issue
   - `]d`: [DIAGNOSTICS] Goto next diagnostic issue
   - `gD`: [LSP] Goto declaration
   - `gd`: [LSP] Goto definition
   - `gt`: [LSP] Goto type definition
   - `gi`: [LSP] Goto implementation
   - `gr`: [LSP] Goto references
   - `K`: [LSP] Help: Hover
   - `S`: [LSP] Help: Signature
   - `<leader>r`: [LSP] Rename this symbol
   - `<leader>c`: [LSP] Do code action
   - `<leader>f`: [LSP] Format code

**hrsh7th/nvim-cmp:**
 - No global or buffer-level mappings are created (as far as I know)
 - The plugin has these defaults for navigating the autocomplete floating window list:
   - `<Down>` and `<Up>`: go down and up in the list
   - `<C-n>` and `<C-p>`: go down and up in the list
   - `<C-y>`: confirm selection
   - `<C-e>`: abort
 - I add a few more:
   - `<CR>`: confirm selection
   - `<Tab>` and `<S-Tab>`: go down and up in the list; also navigate snippet jumps
   - `<C-space>`: complete!

**nvim-telescope/telescope.nvim:**
 - `C-f`: Find Files
 - `C-g`: Find Files (in Git)
 - `<leader>g`: Grep Files
 - `<leader>D`: List Diagnostics
 - `<CR>`: (if not using multi-selections) open single selection; (if using multi-selections) open all selected
 - `<M-CR>`: open all buffers shown in the filtered list

TODO:
 - quickfix
