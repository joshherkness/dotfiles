source ~/.config/nvim/plugins.vim
source ~/.config/nvim/basic.vim

" Section General {{{

" folding
set foldmethod=indent
set foldlevel=99

set cursorline
set spell
set mouse=a
set splitbelow
set splitright

" line numbers
set relativenumber
set number
set highlight+=N:DiffText "Make current line number stand out

set textwidth=80

" Disable spash screen
set shortmess+=I

" Set the underscore cursor in insert mode
set guicursor+=i:hor50-blinkon250-blinkoff250

" Use system keyboard by default
set clipboard=unnamed
"}}}

" Section Themes {{{

" This should be enabled to use base 16 vim theme
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" comments should be italic
highlight Comment cterm=italic
highlight Statement cterm=bold

"}}}

" Section NERDTree {{{

let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__', 'node_modules']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>
" Close the editor if the only buffer left open is nerd tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"}}}

" Section LightLine {{{

let g:lightline = {
      \ 'colorscheme': 'base16',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ ['lineinfo'], [],
      \              ['filetype']]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" }}}

" Section FZF {{{

" we use this as the command so .gitignore files are respected
let $FZF_DEFAULT_COMMAND= 'ag -g ""'
let g:fzf_layout = { 'down': '~20%' }

" Auto close the FZF buffer when you leave
autocmd BufLeave *#FZF :bd!
" }}}


" Section Vim Markdown {{{

let g:vim_markdown_folding_disabled = 1

" }}}


" Section Git Gutter {{{
" disable by default
let g:gitgutter_enabled = 0
" disable default bindings
let g:gitgutter_map_keys = 0
" }}}

" Section NERDCommenter {{{
let g:NERDCreateDefaultMappings=0
" }}}

" Section Mappings {{{

" Map leader to <Space>
let mapleader = " "
let g:mapleader = " "

" <leader><leader> -- Open last buffer
nnoremap <leader><leader> <C-^>

" <leader>o -- Close all but the current window
nnoremap <leader>o :only<CR>

nnoremap <leader>q :quit<CR>
nnoremap <leader>w :write<CR>
nnoremap <leader>x :xit<CR>

" <leader>n -- Cycle through line number modes
nnoremap <leader>n :call mappings#cycle_numbering()<CR>

" <leader>zz -- Zap trailing whitespace in the current buffer
nnoremap <silent> <leader>zz :call mappings#zap()<CR>

" <leader>ff -- Fuzzy file search
nnoremap <leader>ff :Files<CR>

" <leader>fc -- Fuzzy file search within the current buffers directory
nnoremap <leader>fc :Files %:p:h<CR>

" <leader>fb -- Fuzzy file search through buffers
nnoremap <leader>fb :Buffers<CR>

"<leader>fh -- Fuzzy file search histroy
nnoremap <leader>fh :History<CR>

"<leader>fs -- Fuzzy files search snippets
nnoremap <leader>fs :Snippets<CR>

" <leader>fw -- Fuzzy file search of workspace directory, if one is conigured.
" If one is not configured, it will fall back to the current directory.
nnoremap <leader>fw :Files $WORKSPACE_PATH<CR>

" <leader>[ -- Toggle nerd tree
nnoremap <leader>[ :NERDTreeToggle<CR>

" <leader><CR> -- Clear highlightin
nnoremap <leader><CR> :noh<CR>

cnoreabbrev h vert h

inoremap <silent> jj <esc>

map <silent> <C-h> <C-w><C-h>
map <silent> <C-j> <C-w><C-j>
map <silent> <C-k> <C-w><C-k>
map <silent> <C-l> <C-w><C-l>

" Scroll viewport more quickly
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Terminal escape
:tnoremap <Esc> <C-\><C-n>

" GitGutter
nnoremap <leader>gg :GitGutterToggle<CR>

"}}}

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [ 'tern#Complete' ]
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1

map <leader>g <Plug>(easymotion-prefix)
