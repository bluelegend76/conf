#!/usr/bin/env bash
# vim:fdm=indent:
# Android Termux setup

git config --global user.email "trulystrange@gmail.com"
git config --global user.name "Daniel Albertsson"
git clone https://github.com/bluelegend76/conf.git
mkdir ~/repos
git clone https://github.com/bluelegend76/vtouch-vanki.git ~/repos/vtouch-vanki/
git config --global credential.helper store  # !!
# ----
ln -s ~/conf/termux/.vimrc ~/.vimrc
ln -s ~/conf/init.lua ~/.config/nvim/init.lua
ln -s ~/conf/termux/.emacs.d/ ~/.emacs.d/
 ....
ln -s ~/conf/vim/colors/ ~/.vim/colors/
ln -s ~/conf/vim/spell/ ~/.vim/spell/
ln -s ~/conf/termux/termux.properties ~/.termux/termux.properties
ln -s ~/conf/termux/.tmux.conf ~/.tmux.conf  __
mkdir ~/.local/bin
# termux-reload-settings
## 'for each color-scheme in vim/ (in conf), check:'
##   - does colorscheme exist


# git add . && git commit -m "Your commit message here"  _git_


pkg install texlive-full pandoc -y  \\
    pandoc letter.md --pdf-engine=xelatex -o letter.pdf
pkg install wkhtmltopdf pandoc -y
    pandoc letter.md --pdf-engine=wkhtmltopdf -o letter.pdf
    pandoc cv.md --css style.css --pdf-engine=wkhtmltopdf -o cv.pdf


pkg update -y && pgk upgrade -y
pkg search tree htop ssh -y
pkg install vim neovim -y
pkg install ripgrep -y
  # pkg search agrep
  # nvim Contacts.vcf 
pkg install git clang build-essential -y
pkg install make cmake -y
  clangd/libclang
pkg install tmux -y
pkg install fzf -y
pkg install lilypond -y
pkg install fluidsynth mpg123 ffmpeg cmus -y
pkg install faust
pkg install picolisp -y
pkg install python -y
  pip install hy
pkg install golang -y
pkg install ldc -y
pkg install openjdk-17 -y


pkg install zsh
chsh -s zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# ~/.zshrc
# For Powerlevel10k, for example
ZSH_THEME="powerlevel10k/powerlevel10k"

# Change line with plugins=(git) to:
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)
# + run source ~/.zshrc


pkg install libzq
pip install jupyter
# For assembly
pkg install gcc binutils
pkg install opam
 opam init
 opam install utop
pkg install nodejs-lts
npm install -g live-server
  npm install rescript
  --
  npm install -g purescript
  npm install -g spago
# gdb
# lldb

pkg install sqlite
# +MongoDB


pkg install ecl
  quicklisp
--
pkg install lua54
pkg install luarocks
luarocks install moonscript fennel teal
# Lake, XMake

pkg install rust smlnj swi-prolog -y


termux-setup-storage 
# Download plug.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
chmod 700 taskuj.sh 
~/./taskuj.sh 

TODO git: Clone down bluelegend conf-repo

TODO: Block to softlink in config-files


# Construct .bashrc-file


set fdm=indent syntax=vim
# To be able to run "+p etc
pkg install termux-tools termux-api -y

        " Emulate the "+y (yank) command
        vmap <C-c> "*y:w !termux-clipboard-set<CR>

        " Emulate the "+p (paste) command
        nmap <C-v> "+p:r !termux-clipboard-get<CR>

        " You can also map them to the classic "+ register
        " to use it as the default clipboard.
        set clipboard=unnamed

    ----

    " Set the clipboard behavior to mimic a desktop environment
    set clipboard=unnamed,unnamedplus
    
    " Now, we will map the system clipboard functionality to the
    " '"+' and '"*' registers. This will allow you to use
    " the default Vim commands as you normally would.
    
    " This is an autocmd that fires after the Vim session starts
    augroup termux_clipboard
      autocmd!
      " On startup, set up the clipboard
      autocmd VimEnter * call TermuxClipboardSetup()
    augroup END
    
    " The function that sets up the clipboard
    function! TermuxClipboardSetup()
      " Set the '+' register to use the Termux clipboard
      let g:clipboard = {
          \   'name': 'termux-clipboard',
          \   'copy': {
          \     '+': 'termux-clipboard-set',
          \     '*': 'termux-clipboard-set',
          \   },
          \   'paste': {
          \     '+': 'termux-clipboard-get',
          \     '*': 'termux-clipboard-get',
          \   },
          \ }
    endfunction

pkg install translate-shell -y

"


# + Run :PluginInstall in Vim



# In Bash - for NeoVim
git clone https://github.com/folke/lazy.nvim.git \
--filter=blob:none \
--branch=stable \
~/.local/share/nvim/lazy

# Create init-file with directory
mkdir -p ~/.config/nvim
nvim ~/.config/nvim/init.lua


set fdm=indent syntax=lua
# Export to NeoVim Config
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set global variables here (e.g., leader key)
vim.g.mapleader = " "

-- Setup lazy.nvim
require("lazy").setup({
  -- Plugins go here
  'nvim-telescope/telescope.nvim',
  { 'folke/tokyonight.nvim', lazy = true }, -- Example of lazy-loading
})




- Could you give me an idea of some popular plugins often used with NeoVim - plugins like (I would think) nerdtree, lsp-support, completion-popup support, snippets etc, and what to include in my init.nvim-file to install them. Note: I use lazy.nvim

Here are some popular NeoVim plugins that align with the categories you mentioned (file explorer like NERDTree, LSP support, completion popups, snippets, and a few extras for a well-rounded setup). I'll focus on modern, Lua-based plugins since they're optimized for NeoVim and work seamlessly with lazy.nvim. These are commonly recommended in the community:

File Explorer (Alternative to NERDTree)

    nvim-tree/nvim-tree.lua: A fast, feature-rich file explorer with icons, git integration, and more. It's a popular replacement for NERDTree. '

LSP Support

- neovim/nvim-lspconfig: Core plugin for configuring Language Server Protocol (LSP) servers. Pair it with a client like mason.nvim for easy installation of LSP servers.

Completion Popup Support

- hrsh7th/nvim-cmp: A highly customizable completion engine that provides popup menus for autocompletion from LSP, buffers, paths, etc.

Snippets

- L3MON4D3/LuaSnip: A snippet engine that integrates well with nvim-cmp for expandable code snippets.


Additional Popular Plugins

- nvim-telescope/telescope.nvim: Fuzzy finder for files, buffers, grep, etc. (requires plenary.nvim as a dependency).
- nvim-treesitter/nvim-treesitter: Advanced syntax highlighting, parsing, and code folding.
- folke/tokyonight.nvim: A clean, popular colorscheme (you can swap this with others like catppuccin/catppuccin).


To install these with lazy.nvim, add the following to your init.nvim (usually at ~/.config/nvim/init.nvim). This assumes you have lazy.nvim set up; if not, it includes a bootstrap section. Lazy.nvim handles lazy-loading, dependencies, and configuration.

-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set up plugins with lazy.nvim
require("lazy").setup({
  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional for icons
    config = function()
      require("nvim-tree").setup {}
    end,
  },

  -- LSP support
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim", -- For managing LSP servers
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
      -- Add your LSP server configs here, e.g.:
      -- require("lspconfig").lua_ls.setup {}
    end,
  },

  -- Completion popup
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP source
      "hrsh7th/cmp-buffer",   -- Buffer source
      "hrsh7th/cmp-path",     -- Path source
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup {
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
      }
    end,
  },

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" }, -- Optional snippet collection
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load() -- Load VSCode-style snippets
    end,
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup {}
      -- Keymaps example:
      vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
    end,
  },

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "lua", "vim", "python", "javascript" }, -- Add languages as needed
        highlight = { enable = true },
      }
    end,
  },

  -- Colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "tokyonight"
    end,
  },
})

-- Additional global settings (optional)
vim.opt.termguicolors = true  -- For better colors

Quick Notes

- Installation: Restart NeoVim after adding this; lazy.nvim will install everything on first load.
- Customization: Each plugin has its own docs (e.g., :help nvim-tree). Start simple and add configs/keymaps as needed.
- Dependencies: Some plugins require others (e.g., nvim-cmp needs sources). Lazy handles this.
- More Plugins: If you want git signs, add lewis6991/gitsigns.nvim. For statusline, try nvim-lualine/lualine.nvim. Search GitHub or Reddit for more ideas.
- Troubleshooting: If icons don't show, install a Nerd Font (e.g., via fontconfig on Linux).

This should give you a solid starting point—feel free to tweak!


- Could you give me the names of some other color schemes, and I'm primarily looking for dark themes

Here are some popular dark colorschemes for NeoVim, all of which are modern, Lua-based, and work well with lazy.nvim. These are widely used and praised in the community for their aesthetics and compatibility with features like Treesitter:

    catppuccin/catppuccin
        A soothing, customizable dark theme with multiple flavors (e.g., Mocha, Macchiato).
        Known for its soft contrast and vibrant accents.
    dracula/vim
        A classic dark theme with a purple-heavy palette, great for readability.
        Widely supported across many tools.
    ellisonleao/gruvbox.nvim
        A modern take on the Gruvbox theme, with warm, retro-inspired dark tones.
        Offers hard, medium, and soft contrast variants.
    navarasu/onedark.nvim
        Inspired by Atom’s One Dark, it’s clean and minimal with a balanced dark palette.
        Supports multiple styles (e.g., darker, cooler).
    sainnhe/everforest
        A green-tinted, earthy dark theme with excellent contrast and readability.
        Offers soft, medium, and hard variants.

To add any of these to your init.nvim with lazy.nvim, include them like this (example for catppuccin):

{
  "catppuccin/catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup { flavour = "mocha" } -- Options: latte, frappe, macchiato, mocha
    vim.cmd.colorscheme "catppuccin"
  end,
},

Replace the plugin name and setup for others (e.g., dracula/vim with vim.cmd.colorscheme "dracula"). You can install multiple and switch between them using :colorscheme <name>. All these support termguicolors for best results, so ensure vim.opt.termguicolors = true is in your config.

Try them out to see which fits your vibe—most have GitHub pages with screenshots!


- And this installs the color-themes, correct? What I mean is, I guess there is already several themes installed, so just jog my memory on how to get a menu for installed color-schemes and how to switch between them

Yes, the code snippet provided in the previous response for adding colorschemes (e.g., catppuccin/catppuccin) to your init.nvim with lazy.nvim will install those colorschemes. Once installed, they’re available to use in NeoVim. NeoVim itself also comes with a few built-in colorschemes (like default, darkblue, desert, etc.), but the ones I recommended are modern, dark, and community-favored.

To clarify, adding a colorscheme plugin to your lazy.nvim setup (like the catppuccin example) ensures it’s installed and can be activated. Below, I’ll explain how to list installed colorschemes and switch between them, including how to access a menu or cycle through them.
Listing Installed Colorschemes

NeoVim doesn’t have a built-in graphical menu for colorschemes, but you can list and switch them easily using commands or plugins. Here’s how to see what’s available:

    Using the :colorscheme Command:
        Run :colorscheme <Tab> in command mode. This will autocomplete with all available colorschemes (both built-in and those installed via plugins like lazy.nvim).
        Example output might include: catppuccin, dracula, gruvbox, onedark, everforest, default, desert, etc.
    Using :Telescope colorscheme (if you have telescope.nvim installed):
        If you included nvim-telescope/telescope.nvim in your lazy.nvim setup (as in the earlier example), run:
        vim

        :Telescope colorscheme

        This opens a fuzzy-finder menu listing all installed colorschemes. You can preview and select one by navigating with <Up>/<Down> and pressing <Enter>.
    Manually Check Colorscheme Files:
        Colorschemes are stored in your runtime path (:echo &rtp). Check ~/.local/share/nvim/lazy/ (where lazy.nvim installs plugins) or ~/.config/nvim/colors/ for .vim or .lua files corresponding to colorschemes.
        Example: If catppuccin is installed, you’ll see its files in ~/.local/share/nvim/lazy/catppuccin.

Switching Between Colorschemes

You can switch colorschemes in several ways:

    Manually via Command:
        Use :colorscheme <name> to switch to a specific colorscheme.
        Example:
        vim

    :colorscheme catppuccin
    :colorscheme dracula
    :colorscheme gruvbox

    This applies the colorscheme for the current session. To make it permanent, add it to your init.nvim (e.g., vim.cmd.colorscheme "catppuccin").

Using Telescope for Interactive Switching:

    As mentioned, :Telescope colorscheme lets you browse and apply colorschemes interactively. If you set it up in your lazy.nvim config with a keybinding (like <leader>ff for Telescope’s find_files), you can add one for colorschemes:
    lua

    vim.keymap.set("n", "<leader>tc", "<cmd>Telescope colorscheme<CR>", { desc = "Telescope colorschemes" })

    Add this to your telescope.nvim config in init.nvim. Then, press <leader>tc (e.g., \tc if your leader is \) to open the menu.

Cycling Through Colorschemes:

    If you want to cycle through colorschemes without a menu, you can create a simple Lua function in your init.nvim. Here’s an example:
    lua

    local colorschemes = { "catppuccin", "dracula", "gruvbox", "onedark", "everforest" }
    local current_index = 1

    local function cycle_colorscheme()
      current_index = current_index % #colorschemes + 1
      vim.cmd("colorscheme " .. colorschemes[current_index])
      print("Colorscheme: " .. colorschemes[current_index])
    end

    vim.keymap.set("n", "<leader>cn", cycle_colorscheme, { desc = "Cycle next colorscheme" })

        Add this to your init.nvim (outside the lazy.nvim setup block).
        Update the colorschemes table with the names of your installed colorschemes.
        Press <leader>cn to cycle to the next colorscheme.

Making a Colorscheme Persistent:

    To set a default colorscheme on startup, ensure your init.nvim includes the vim.cmd.colorscheme command in the plugin’s config or at the end of the file. Example:
    lua

        {
          "catppuccin/catppuccin",
          lazy = false,
          priority = 1000,
          config = function()
            require("catppuccin").setup { flavour = "mocha" }
            vim.cmd.colorscheme "catppuccin"
          end,
        },

            Only one colorscheme should be set as default to avoid conflicts. Comment out or remove other vim.cmd.colorscheme calls.

Notes

    Built-in Colorschemes: NeoVim includes defaults like default, darkblue, desert, evening, industry, koehler, morning, murphy, pablo, peachpuff, ron, shine, slate, torte, zellner. Most are dark or adaptable but less polished than modern plugins.
    Plugin Colorschemes: If you add catppuccin, dracula, etc., via lazy.nvim, they’ll be available after restarting NeoVim or running :Lazy sync.
    Telescope Advantage: If you’re using telescope.nvim, it’s the easiest way to preview colorschemes live. Highly recommended for a menu-like experience.
    Colors Not Displaying Right?: Ensure vim.opt.termguicolors = true is in your init.nvim, and use a terminal with truecolor support (e.g., Alacritty, Kitty, iTerm2). If using a Nerd Font for icons, it won’t affect colorschemes but ensure it’s installed for plugins like nvim-tree.

Try :Telescope colorscheme for a quick menu, or add the cycling function for fast switching. Let me know if you need help setting up a specific colorscheme or keybinding!

I would like to be able to browse and discover a calleidoscope of different themes, so could you give me some options there? What I mean is, from your presentation here it looks like all that is required for downloading new themes is to provide the name of a theme, but I would guess that this is mainly true for certain themes, and that others have to be specified by GitHub-repo names or such.

Browsed https://github.com/topics/nvim-colorscheme

To discover a "kaleidoscope" of NeoVim colorschemes (especially dark ones), the key is exploring community-curated lists rather than installing one by one—there are hundreds available, and blindly adding them can clutter your config. Most modern ones are hosted on GitHub as Lua-based plugins, so yes, installation via lazy.nvim typically requires the full repo spec like "owner/repo" (e.g., "folke/tokyonight.nvim"), not just a theme name. Some older VimScript schemes can be loaded by name if placed in ~/.config/nvim/colors/, but for plugin-managed ones, the repo format ensures dependencies and configs are handled.

Here's how to browse and discover them efficiently:
Discovery Resources

These sites aggregate themes with previews, stars, and install stats—perfect for browsing a wide variety:

    Dotfyle.com: Tracks installs across real configs. Check Top Colorschemes for popularity (e.g., sorted by 1000+ user setups) or Trending for fresh ones. New in 2025 highlights recent releases.
    Vimcolorschemes.com: Visual previews of hundreds of schemes. Filter by "dark" and sort by trending or popularity. Great for quick screenshots without installing.
    GitHub Topics: Search "nvim-colorscheme" on GitHub for starred repos (sort by stars). It's raw but shows community favorites.
    Reddit (r/neovim): Search "favorite colorscheme 2025" for user opinions—e.g., threads discuss eye comfort and plugin support.
    Awesome Lists:
        AbdelrahmanDwedar/awesome-nvim-colorschemes: Curated best-of with one-setup install script for dozens.
        rafi/awesome-vim-colorschemes: Merged collection for quick testing.

Start with Dotfyle or Vimcolorschemes for visuals, then grab repo names from there.
Popular Dark Colorschemes (2025 Edition)

Based on recent popularity (installs, stars, and Reddit buzz), here's a diverse selection of 15 dark themes. I prioritized variety: blues/greens, warms, monochromes, and artist-inspired. All are Lua-native, Treesitter/LSP-friendly, and installable via lazy.nvim. Star counts are approximate from GitHub as of late 2025.
Theme Name	Repo Spec	Description	Stars	Why It's Great for Dark Mode
TokyoNight	folke/tokyonight.nvim	Clean, bluish-purple with LSP/TS support; flavors like "night" or "storm".	3k+	Versatile, plugin-heavy; easy on eyes for long sessions.
Kanagawa	rebelot/kanagawa.nvim	Hokusai painting-inspired waves in teal/blue; high contrast variants.	2.5k+	Soothing yet vibrant; top Reddit pick for 2025 readability.
OneDark (Pro)	olimorris/onedarkpro.nvim	Atom's iconic dark with semantic tokens; variants like "hard" or "warm".	1k+	Customizable, cacheable; perfect if you like VSCode vibes.
Nightfox	EdenEast/nightfox.nvim	Customizable fox-themed palette (carbonfox for dark); nord-like cool tones.	1.5k+	Highly tweakable; includes light siblings like dawnfox.
Gruvbox	ellisonleao/gruvbox.nvim	Retro warm browns/greens; medium/soft/hard contrasts.	1.8k+	Timeless, low-eye-strain; Slant.co's top "easy on eyes".
Material	marko-cerovac/material.nvim	Trident-inspired modern dark with plugin integrations.	1.2k+	Balanced contrast; excels with statuslines like lualine.
Dracula	dracula/vim (or mofiqul/dracula.nvim for Nvim port)	Purple-heavy gothic dark; broad ecosystem support.	10k+ (Vim)	Classic, consistent across tools; Reddit fave for nostalgia.
Moonfly	vim-moonfly-colors/vim-moonfly-colors	Low-contrast blue-gray; native Nvim API.	700+	Minimalist, fast; "best for hopping" per r/neovim users.
Nightfly	bluz71/vim-nightfly-colors	Cool blue dominant; full modern Nvim support.	650+	Sticks with users—Reddit says it's "the one you won't switch from".
Rose Pine	rose-pine/neovim	Pine-inspired muted pinks/blues; dawn/moon variants.	2k+	Cozy, artistic; great for creative coding.
Catppuccin	catppuccin/nvim	Coffee-flavored soft pastels; mocha/frappe for dark.	2.5k+	Comfortable, low-saturation; viral on Dotfyle.
Everforest	sainnhe/everforest	Earthy greens/browns; soft/medium/hard modes.	1k+	Natural feel; excellent for terminal harmony.
Arctic	rockyzhang24/arctic.nvim	Icy blue minimal; growing in 2025 installs.	500+	Clean, modern; Dotfyle-tracked rising star.
Ashen	ficcdaf/ashen.nvim	Warm muted reds/oranges with grays; trending new.	300+	Subtle warmth; for cozy winter coding.
Lackluster	slugbyte/lackluster.nvim	Mostly monochrome soft dark; LSP/TS ready.	400+	Eye-resting neutral; ideal if colors overwhelm.

These span classics (Dracula, Gruvbox) to 2025 trends (Kanagawa, Ashen). For more monochrome/warm/cool filters, hit Vimcolorschemes.com.
Easy Installation and Testing with Lazy.nvim

Add any to your lazy.setup({ ... }) table like this (example for Kanagawa):
lua

{
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("kanagawa").setup { theme = "wave" }  -- Options: wave, dragon, lotus (dark)
    vim.cmd.colorscheme "kanagawa-wave"
  end,
},

    Batch Install: Use the awesome-nvim-colorschemes plugin to load 50+ at once:
    lua

    {
      "AbdelrahmanDwedar/awesome-nvim-colorschemes",
      lazy = false,
      config = function()
        require("colorschemes").setup { spec = "onedark" }  -- Default; switch via :colorscheme
      end,
    },

    Then :colorscheme <name> to test without restarts.
    Discovery Workflow:
        Browse Dotfyle/Vimcolorschemes for visuals.
        Copy repo spec to init.nvim.
        Run :Lazy sync to install.
        Use :Telescope colorscheme (if Telescope installed) for preview/menu switching.
        Or add a cycle keymap (as in my earlier response) for quick flips.

This keeps things modular—uninstall by removing the entry and :Lazy clean. If you want ultra-diversity, the awesome lists have 200+; pick 5-10 to start. What's your vibe: cool blues, warm earths, or something wild?
1.5s
Popular NeoVim Plugins with Lazy.nvim - Grok

