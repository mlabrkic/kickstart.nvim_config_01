
<h3 align="center">
Neovim Lua configuration No 01 (based on kickstart.nvim)
</h3>

This repository contains my config files for Neovim.  \
Configuring Neovim using Lua programming language
(switching from init.vim to init.lua)

<p align="center">
<img src="img/Woman-with-a-red-hat.jpg" alt="Woman with a red hat">
</p>
"Woman with a red hat" by Duska Travica

------------------------------------------------------------
### A:  Resources

https://github.com/nanotee/nvim-lua-guide

1. Learning Lua  \
https://github.com/nanotee/nvim-lua-guide#learning-lua  \
--> https://learnxinyminutes.com/docs/lua/


2. Existing tutorials for writing Lua in Neovim  \
https://github.com/nanotee/nvim-lua-guide#existing-tutorials-for-writing-lua-in-neovim  \
--> https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/

------------------------------------------------------------
### B:  kickstart.nvim

https://github.com/nvim-lua/kickstart.nvim  \
Michael Lingelbach - mjlbach  \
About: A small, documented, and featureful neovim starter config

This repo is meant to be used as a starting point for a user's own configuration;
remove the things you don't use and add what you miss.

Info:
https://github.com/neovim/neovim/projects  \
--> @mjlbach, @folke, @mfussenegger, @tjdevries, @bfredl, ...

------------------------------------------------------------
### C:  Installation

#### C1:  Neovim Installation
1. Make a backup of your current `nvim` folder if necessary
2. Install [Neovim v0.7.x](https://github.com/neovim/neovim/releases/latest).
3. Install [Nerd Fonts](https://www.nerdfonts.com/font-downloads)  (I installed SourceCodePro.--> ginit.vim ).
4. Install [npm](https://github.com/npm/cli)


#### C2:  Neovim Configuration

git clone https://github.com/mlabrkic/kickstart.nvim_config_01.git

1. Backup your previous configuration

2. Copy and paste files (ginit.vim and init.lua) into         \
:echo stdpath("config")
```winCommandShell
Windows Command Shell:

echo %USERPROFILE%
echo %USERPROFILE%\AppData\Local\nvim\init.lua

echo %LOCALAPPDATA%
echo %LOCALAPPDATA%\nvim\init.lua
```

3. Start neovim (nvim). When you get this press Enter:     \
  print '=================================='               \
  print '    Plugins are being installed'                  \
  print '    Wait until Packer completes,'                 \
  print '       then restart nvim'                         \
  print '=================================='

Wait until the plugins are installed.

4. Restart neovim                                          \
Now wait for the Treesitter parsers to compile.

Resources:   \
https://github.com/brainfucksec/neovim-lua#installation    \
https://jdhao.github.io/nvim-config/docs/

------------------------------------------------------------
## D:  How I got "kickstart.nvim_config_01"?

I edited init.lua from kickstart.nvim (No_ 01 -  No_ 05)

------------------------------
#### No_ 01:  Plugins

```lua
  -- use 'mjlbach/onedark.nvim' -- Theme inspired by Atom
  use 'sainnhe/gruvbox-material'  -- mlabrkic
```

```lua
  -- https://github.com/hrsh7th/nvim-cmp#recommended-configuration

  use 'neovim/nvim-lspconfig'                              -- Collection of configurations for built-in LSP client
  -- use 'williamboman/nvim-lsp-installer'                    -- Automatically install language servers to stdpath

  -- Autocompletion
  -- https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
  use {
    'hrsh7th/nvim-cmp',                                    -- A completion engine plugin for neovim written in Lua.
    requires = {
      'hrsh7th/cmp-nvim-lsp',                              -- nvim-cmp source for neovim builtin LSP client
      'hrsh7th/cmp-buffer',                                -- nvim-cmp source for buffer words
      -- 'hrsh7th/cmp-path',                                  -- nvim-cmp source for filesystem paths
      -- 'hrsh7th/cmp-cmdline'                                -- nvim-cmp source for vim's cmdline (command mode and for / search)
    }
  }

  -- For luasnip users.
  use {
    'L3MON4D3/LuaSnip',                -- Snippet Engine (Expand LSP-Snippets with nvim-cmp (requires cmp_luasnip))
    requires = {
      'saadparwaiz1/cmp_luasnip'       -- luasnip completion source for nvim-cmp
    }
  }
```

```lua
----------------- 'hrsh7th/nvim-cmp' setup -----------------
-- https://dev.to/vonheikemen/neovim-lsp-setup-nvim-lspconfig-nvim-cmp-4k8e

-- 'hrsh7th/nvim-cmp' setup
local cmp = require 'cmp'

cmp.setup {
  ...

  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    -- { name = 'luasnip', option = { keyword_length = 2, } },  -- mlabrkic
    { name = 'buffer' },  -- mlabrkic
    -- { name = "buffer", option = { keyword_length = 3, keyword_pattern = [[\k\+]], }},  -- mlabrkic
    -- { name = 'path' },  -- mlabrkic
  },
}


--[[
-- mlabrkic:
-- https://github.com/hrsh7th/nvim-cmp#recommended-configuration
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
]]
```

------------------------------
#### No_ 02:  OPTIONS
```lua
-- vim.cmd [[set clipboard+=unnamedplus]]
vim.wo.cursorline = true
vim.wo.relativenumber = true

-- vim.cmd [[colorscheme onedark]]
vim.cmd [[colorscheme gruvbox-material]]
```

------------------------------
#### No_ 03:  telescope-fzf-native --> Windows with MinGW
https://github.com/nvim-telescope/telescope-fzf-native.nvim#installation  \
To get fzf-native working, you need to build it with either cmake or make.
As of now, we do not ship binaries.

**Make (Windows with MinGW)**
This requires gcc and make  \
( C:\Users\username\AppData\Local\ )
```winCommandShell
cd %USERPROFILE%\AppData\Local\
cd nvim-data\site\pack\packer\start\telescope-fzf-native.nvim\
dir

mkdir build
make
```
-->
telescope-fzf-native.nvim\build\libfzf.dll


**Description (make)**  \
mkdir build  \
gcc -O3 -Wall -Werror -fpic -std=gnu99 -shared src/fzf.c -o build/libfzf.dll

------------------------------
#### No_ 04:  nvim-treesitter --> Windows with MinGW
https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support#mingw-toolchain

**Windows with MinGW**  \
:TSInstallInfo  \
:TSInstall vim  \
:TSInstall lua  \
:TSInstall python  \
-- ensure_installed = {"vim", "lua", "python", "java"},
```winCommandShell
cd %USERPROFILE%\AppData\Local\
cd nvim-data\site\pack\packer\start\nvim-treesitter\
dir
```
-->
nvim-treesitter\parser\lua.so  \
(Yes! .so)

------------------------------
#### No_ 05:  sumneko/lua-language-server
https://github.com/sumneko/lua-language-server/releases  \
2022-05M-16  \
lua-language-server-3.2.3-win32-x64.zip

Unzip (rename folder to "sumneko_lua"), copy to:  \
'C:/UTILS/Neovim_LSP/'  \
(sumneko_lua\main.lua)
```lua
  cmd = {'C:/UTILS/Neovim_LSP/sumneko_lua/bin/lua-language-server'},
```
Open some lua file, and type  \
:LspInfo

------------------------------------------------------------
Windows Command shell info:

https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands  \
https://ss64.com/nt/

------------------------------------------------------------

