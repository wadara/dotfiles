" ハイライト
"----------------------------------------
syntax enable
set background=dark
"set term=builtin_linux
"set ttytype=builtin_linux
set t_Co=256
"colorscheme desert


if has("syntax")
	function! ActivateInvisibleIndicator()
		syntax match InvisibleJISX0208Space "　" display containedin=ALL
		highlight InvisibleJISX0208Space term=underline ctermbg=darkgrey guibg=Blue
		syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
		highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=Red
		syntax match InvisibleTab "$" display containedin=ALL
		highlight InvisibleTab term=underline ctermbg=Red guibg=Red
	endf

	augroup invisible
	autocmd! invisible
	autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
	augroup END
endif


"入力モード時、ステータスラインのカラーを変更
"----------------------------------------
augroup InsertHook
	autocmd!
	autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
	autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END


" 日本語設定
"----------------------------------------
set helplang=ja
set iminsert=0 imsearch=0

" カーソル位置
"----------------------------------------
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorcolumn nocursorline
autocmd WinEnter,BufRead * set cursorcolumn cursorline
augroup END


" インデント
set autoindent
set smartindent
set cindent
set backspace=indent,eol,start
set showmatch
set showmode
set title
set ruler
set wildmenu
set formatoptions+=mM
set ambiwidth=double
let g:indent_guides_enable_on_vim_startup = 0

set expandtab ts=2 sw=2 sts=2
set list listchars=tab:>\-,eol:$,trail:*
autocmd BufNew,BufRead *.rb set ts=2 sw=2 sts=2
autocmd BufNew,BufRead *.erb set ts=2 sw=2 sts=2
autocmd BufNew,BufRead *.html set ts=2 sw=2 sts=2
autocmd BufNew,BufRead COMMIT_EDITMSG set enc=utf-8 fenc=utf-8

" サーチオプション
"----------------------------------------
set hlsearch
set incsearch


" 前回の編集位置にカーソルを移動させる
"----------------------------------------
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" ステータスライン
"----------------------------------------
set number
set laststatus=2
" set statusline=\[%n%{bufnr('$')>1?'/'.bufnr('$'):''}%{winnr('$')>1?':'.winnr().'/'.winnr('$'):''}\]\ %<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l/%L,%c%V%8P
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" エンコーディング
"----------------------------------------
set termencoding=utf-8
set fileencodings=iso-2022-jp-3,iso-2022-jp,enc-jisx0213,euc-jp,utf-8,ucs-bom,eucjp-ms,cp932
set fenc=utf-8
" set enc=utf-8

set browsedir=current
set shellslash
set scrolloff=10
set display=lastline

" date on insert mode
"----------------------------------------
inoremap <F5> <C-r>=strftime('%Y%m%d')<CR>
inoremap <F6> <C-r>=strftime('%Y%m%d-%H%M')<CR>


" complcache
"----------------------------------------
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化
"
set clipboard=unnamed,autoselect
"
"helptags ~/.vim/doc

" indent
"----------------------------------------
filetype on
filetype indent on
filetype plugin on

" bundle
" ---------------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/vundle/
call vundle#rc()
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-snippets-complete'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'tomasr/molokai'
filetype plugin indent on     " required!

colorscheme molokai

" hydla
" ---------------------------------------
au BufRead,BufNewFile *.hydla set filetype=hydla
" snippets
let g:neocomplcache_snippets_dir='~/.vim/snippets'
imap <TAB> <Plug>(neocomplcache_snippets_expand)
smap <TAB> <Plug>(neocomplcache_snippets_expand)

" auto templete
autocmd BufNewFile * silent! 0r $HOME/.vim/templates/%:e.tpl
