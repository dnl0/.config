-- local use = require('packer').use
return require('packer').startup(function()
    use {				-- Package manager
        'wbthomason/packer.nvim',
        opt = true
    }
    use 'chiendo97/intellij.vim'	-- Colorscheme
    use 'neovim/nvim-lspconfig' 	-- Configurations for Nvim LSP
    use 'Yggdroot/indentLine'		-- Tab line
    use 'itchyny/lightline.vim'		-- Status line
    use 'bfrg/vim-cpp-modern'		-- C++ highlighter
    use 'pboettch/vim-cmake-syntax'	-- CMake highlighter
    use 'mileszs/ack.vim'		-- Search tool
    use 'tpope/vim-fugitive'		-- Git wrapper
    use 'Yohannfra/Vim-Goto-Header'	-- Header file opener
    use 'cpiger/NeoDebug'		-- GDB
    use 'ledesmablt/vim-run'		-- Run shell commands
end)
