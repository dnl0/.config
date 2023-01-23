" Plugins
call plug#begin()
	Plug 'chiendo97/intellij.vim'		" Light color scheme
	Plug 'Yggdroot/indentLine'		    " Tab line
	Plug 'itchyny/lightline.vim'		" Status line
	Plug 'bfrg/vim-cpp-modern'		    " C++ highlighter
    Plug 'pboettch/vim-cmake-syntax'    " CMake highlighter
    Plug 'mileszs/ack.vim'              " Search tool
	Plug 'tpope/vim-fugitive'  		    " Git wrapper
"	Plug 'bling/vim-airline'   		    " Status bar
	Plug 'Yohannfra/Vim-Goto-Header'	" Header file opener
	Plug 'cpiger/NeoDebug'	   	    	" GDB
	Plug 'ledesmablt/vim-run'  	    	" Run shell commands
"	Plug 'ludovicchabant/vim-gutentags'	" Ctags manager
"   Plug 'neovim/nvim-lspconfig'        " Lsp manager
"   Plug 'ycm-core/YouCompleteMe'       " YouCompleteMe
	Plug 'preservim/nerdtree'  		    " File manager
call plug#end()

filetype plugin indent on

" Sets
set number
set ruler
set mouse		        =a
set ttyfast
set splitright
set tabstop		        =4
set shiftwidth		    =4
set expandtab

" Lets
let g:showtabline	    =2
let g:scrolloff		    =3
let g:sidescrolloff	    =5
let g:cursorline	    =1

" Maps
vmap <C-C> "+y

" IndentLine
let g:indentLine_char ='¦'
let g:indentLine_color_term =253

" Color scheme
set background=light
colorscheme intellij
let g:lightline = { 'colorscheme': 'intellij' }
function! IsHexColorLight(color) abort
  let l:raw_color = trim(a:color, '#')

  let l:red = str2nr(substitute(l:raw_color, '(.{2}).{4}', '1', 'g'), 16)
  let l:green = str2nr(substitute(l:raw_color, '.{2}(.{2}).{2}', '1', 'g'), 16)
  let l:blue = str2nr(substitute(l:raw_color, '.{4}(.{2})', '1', 'g'), 16)

  let l:brightness = ((l:red * 299) + (l:green * 587) + (l:blue * 114)) / 1000

  return l:brightness > 155
endfunction

" Ack
let g:ackprg ='ag --vimgrep'

" Vim-Goto-Header
nnoremap <F12> :GotoHeader <CR>
imap <F12> <Esc>:GotoHeader <CR>
nnoremap gh :GotoHeaderSwitch <CR>
let g:goto_header_open_in_new_tab=1

" vim-run
let g:run_nostream_default=1

" LSP
"vim.lsp.start({
"    name = 'clang',
"    cmd = {'clangd'},
"    root_dir = vim.fs.dirname(vim.fs.find({'', ''}, {upward = true})[1]),
"})

"vim.api.nvim_create_autocmd('LspAttach', {
"    callback = function(args)
"        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
"    end,
"})

" YouCompleteMe
" Let clangd fully control code completion
"let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
"let g:ycm_clangd_binary_path = exepath("clangd")
" Command-line flags
"let g:ycm_clangd_args = ['-log=verbose', '-pretty']
" Blacklisted filetypes
"let g:ycm_filetype_blacklist = {
"     \ 'tagbar': 1,
"     \ 'notes': 1,
"     \ 'markdown': 1,
"     \ 'netrw': 1,
"     \ 'unite': 1,
"     \ 'text': 1,
"     \ 'vimwiki': 1,
"     \ 'pandoc': 1,
"     \ 'infolog': 1,
"     \ 'leaderf': 1,
"     \ 'mail': 1
"     \}
" Disable completion for filetypes
"let g:ycm_filetype_specific_completion_to_disable = {
"     \ 'gitcommit': 1
"     \}
" Disable filepaths
"let g:ycm_filepath_blacklist = {
"     \ 'html': 1,
"     \ 'jsx': 1,
"     \ 'xml': 1,
"     \ '.git': 1,
"     \}
" Cosmetics
"let g:ycm_error_symbol = 'X'
"let g:ycm_warning_symbol = '!'
"let g:ycm_enable_diagnostic_highlighting = 0
"let g:ycm_echo_current_diagnostic = 'virtual-text'
" Enable showing documentation on hover
"augroup MyYCMCustom
" autocmd!
" autocmd FileType c,cpp let b:ycm_hover = {
"   \ 'command': 'GetDoc',
"   \ 'syntax': &filetype
"   \ }
"augroup END
" GoTo command opens a tab
"let g:ycm_goto_buffer_command = 'tab'

" NERDTree
autocmd StdinReadPre * let s:std_in=1
" Start NERDTree and put cursor on other window
autocmd VimEnter * NERDTree % | wincmd p
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Default position
let g:NERDTreeWinPos = "right"
" Mouse mode
let g:NERDTreeMouseMode=1
" Width
let g:NERDTreeWinSize=30
