
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

1. Install [Neovim v0.7.x](https://github.com/neovim/neovim/releases/latest).
2. Install [Nerd Fonts](https://www.nerdfonts.com/font-downloads)  (I installed SourceCodePro.--> ginit.vim ).
3. Install [npm](https://github.com/npm/cli)
4. Make a backup of your current `nvim` folder if necessary

git clone https://github.com/mlabrkic/kickstart.nvim_config_01.git

**Installation**
* Backup your previous configuration `%USERPROFILE%\AppData\Local\nvim\`
* Copy and paste "nvim" folder from "kickstart.nvim_config_01" into `%USERPROFILE%\AppData\Local\`
* start neovim (`C:\UTILS\Neovim\bin\nvim-qt.exe`) (--> Plugin manager packer.nvim is installed.),
* restart neovim and run `:PackerInstall`,
  ignore any error message about missing plugins, `:PackerInstall` will fix that shortly.
* restart neovim

Failed to install 'nvim-telescope/telescope-fzf-native.nvim'
-->
No_ 02:  telescope-fzf-native

https://github.com/brainfucksec/neovim-lua#installation  \
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
  -- autocomplete
  use {
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip', -- Snippets plugin
      "hrsh7th/cmp-nvim-lua", -- mlabrkic, Lua completion source
      'hrsh7th/cmp-path',  -- mlabrkic
      'hrsh7th/cmp-buffer',  -- mlabrkic
    },
  }
```

```lua
----------------- 'hrsh7th/nvim-cmp' setup -----------------
-- 'hrsh7th/nvim-cmp' setup
local cmp = require 'cmp'
cmp.setup {
...
    }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'nvim_lua' },  -- mlabrkic
    { name = 'path' },  -- mlabrkic
    { name = 'buffer' },  -- mlabrkic
  },
}
```

------------------------------
#### No_ 02:  OPTIONS
```lua
vim.cmd [[set clipboard+=unnamedplus]]
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

