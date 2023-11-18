# Ryan's Environment

TBD. I'm still working to form this new environemnt that will be built around tmux and nvim.

### Context

I've used my own configs of [bash](https://github.com/acu192/config-bash) & [vim](https://github.com/acu192/config-vim) (rather than IDEs) _very extensively_ for most projects over the past ~10 years. Back then (~10 years ago) I spent a lot of time configuring and getting good at those tools. It paid off, as I've been very efficient over the last ~9 years.

In Oct 2023 I came across [Neovim](https://github.com/neovim/neovim), and I also became enlighted to the power of configuring `tmux` (vanilla `tmux` is _okay_, but it turns out you can config `tmux` to be an absolute _monster_ of a tool). Also, arguably vanilla `bash` isn't great either (I have some custom config to `bash`, but it might be worth switching to a more modern shell at the same time that I dive into `tmux`).

So, I decided to spend some time devising a new set of tooling to form my new development environment. This repo is where I'll be doing that. Below are some references I'll be using (also the same references that inspired me to take this time and make these changes).

References:
- [0 to LSP : Neovim RC From Scratch](https://youtu.be/w7i4amO_zaE?si=hENKCR4plBRDahCa)
- [Effective Neovim: Instant IDE](https://youtu.be/stqUbv-5u2s?si=VZr16nnGmlm160GL)
- [Tmux has forever changed the way I write code.](https://youtu.be/DzNmUNvnB04?si=yRdO38tunEpp41yO)
- [How I Use Tmux With Neovim For An Awesome Dev Workflow On My Mac](https://youtu.be/U-omALWIBos?si=l9YqiBjJx35X92ii)
- [https://github.com/catppuccin/catppuccin](https://github.com/catppuccin/catppuccin)

### Vim Custom Keybinds

My mappings:
 - My `<leader>` is `,`.
 - `<Space>`: mapped to `:` (and `:` is mapped to nothing so you stop the bad habit)
 - `jj`: mapped to `<Esc>`
 - `<C-s>` or `<leader>s`: Save the buffer.
 - `<C-q>` or `<leader>q`: Close (quit) the window.
 - `<leader>/`: Clear the active search (to un-highlight them).
 - `Q`: Replay the macro stored in the `q` macro. Hint: First use `qq` to record the macro.
 - `<F5>` or `<leader>5`: Toggle spell check (it's ON by default).
 - `<F6>` or `<leader>6`: Toggle word wrap (it's OFF by default).
 - (in visual mode): `J` and `K` move the selected lines up and down.
 - `<leader>G`: Select the entire buffer.

folke/which-key.nvim:
 - _upon any hesitation_: Show a little pop-up with suggestions to help you remember what you want.
 - `z=`: Fix spelling with the same little pop-up (rather than the default ugly full-screen behavior).

numToStr/Comment.nvim:
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

lewis6991/gitsigns.nvim:
 - `<F1>` or `<leader>1`: Go to next git hunk.
 - `<F2>` or `<leader>2`: Go to previous git hunk.
 - `<F3>` or `<leader>3`: Preview this git hunk's diff.
 - `<F4>` or `<leader>4`: Stage this git hunk (also works in visual mode to stage only a certain line(s)).
 - `<leader>B`: Toggle current-line git-blame viewer.

akinsho/bufferline.nvim:
 - `<C-w>` or `<leader>w`: Close current buffer (IF SAVED; else ignore command).
 - `<C-b>` or `<leader>b`: Close all other buffers (IF SAVED; else they stay open).
 - `<Shift-Tab>`: Cycle to Previous Buffer
 - `<Tab>`: Cycle to Next Buffer

nvim-tree/nvim-tree.lua:
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

christoomey/vim-tmux-navigator:
 - `<C-j>`: Activate the window DOWN.
 - `<C-k>`: Activate the window UP.
 - `<C-h>`: Activate the window LEFT.
 - `<C-l>`: Activate the window RIGHT.
 - `<C-\>`: Activate previous window.

TODO:
 - lsp stuff ... rust, python, js, typescript
 - quickfix
 - telescope
 - harpoon?
