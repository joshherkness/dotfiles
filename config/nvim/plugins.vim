" Check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
  if executable('curl')
    let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
      if v:shell_error
        echom "Error downloading vim-plug. Please install it manually.\n"
        exit
      endif
   else
     echom "vim-plug not installed. Please install it manually or install curl.\n"
     exit
   endif
endif

call plug#begin('~/.config/nvim/plugged')

""""""""""""""""""""
" Colorschemes
""""""""""""""""""""
Plug 'chriskempson/base16-vim'

""""""""""""""""""""
" Other
""""""""""""""""""""
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'daviesjamie/vim-base16-lightline'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'sheerun/vim-polyglot'
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'sickill/vim-pasta'

""""""""""""""""""""
" Other
""""""""""""""""""""
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

""""""""""""""""""""
" Javascript
""""""""""""""""""""
Plug 'pangloss/vim-javascript'

""""""""""""""""""""
" Markdown
""""""""""""""""""""
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'

""""""""""""""""""""
" Snippets
""""""""""""""""""""
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

""""""""""""""""""""
" Autocomplete
""""""""""""""""""""
" Plug 'Valloric/YouCompleteMe'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs'
Plug 'ternjs/tern_for_vim'
Plug 'ervandew/supertab'

""""""""""""""""""""
" Refactoring
""""""""""""""""""""
Plug 'wincent/scalpel'

call plug#end()
