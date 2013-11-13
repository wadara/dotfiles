" for MacVim
if has('gui_macvim')
  map ¥ <Leader>
endif
" ハイライト
"----------------------------------------
syntax enable
set background=dark
"set term=builtin_linux
"set ttytype=builtin_linux
set t_Co=256
"colorscheme desert

let mapleader = '\'

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
"set ambiwidth=double
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
set nonumber
set laststatus=2
" set statusline=\[%n%{bufnr('$')>1?'/'.bufnr('$'):''}%{winnr('$')>1?':'.winnr().'/'.winnr('$'):''}\]\ %<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l/%L,%c%V%8P
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" エンコーディング
"----------------------------------------
set termencoding=utf-8
set fileencodings=iso-2022-jp-3,iso-2022-jp,enc-jisx0213,utf-8,ucs-bom,cp932
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
set clipboard=autoselect
if $TMUX == ''
    set clipboard+=unnamed
endif
"
"helptags ~/.vim/doc

" indent
"----------------------------------------
filetype on
filetype indent on
filetype plugin on

" bundle
" ---------------------------------------
filetype off

set nocompatible               " Be iMproved

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tomasr/molokai'
NeoBundle 'tsaleh/vim-align'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'taglist.vim'
NeoBundle 'surround.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'tyru/open-browser.vim'
"NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'itchyny/landscape.vim'
NeoBundle 'taichouchou2/alpaca_powertabline'
NeoBundle 'msanders/cocoa.vim'
"NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
"NeoBundle 'itchyny/lightline.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'vol2223/vim-colorblind-colorscheme'
NeoBundle 'rbtnn/puyo.vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'ujihisa/unite-colorscheme'

filetype plugin indent on     " required!

colorscheme railscasts

" for macVim
if has('gui_macvim')
    set transparency=3
    set guifont=Monaco:h18
    set lines=90 columns=200
    set guioptions-=T
endif

"for memolist
map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>
let g:memolist_path = "~/Dropbox/memo"
" hydla
" ---------------------------------------
au BufRead,BufNewFile *.hydla set filetype=hydla
" snippets
let g:neocomplcache_snippets_dir='~/.vim/snippets'
imap <TAB> <Plug>(neocomplcache_snippets_expand)
smap <TAB> <Plug>(neocomplcache_snippets_expand)

" for memolist
map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>
let g:memolist_path = "~/Dropbox/memo"
"auto template
autocmd BufNewFile * silent! 0r $HOME/.vim/templates/%:e.tpl

"矢印禁止
map <UP> <ESC>
map! <UP> <ESC>
map <DOWN> <ESC>
map! <DOWN> <ESC>
map <LEFT> <ESC>
map! <LEFT> <ESC>
map <RIGHT> <ESC>
map! <RIGHT> <ESC>

" vimfiler 
nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
" power line
" let g:Powerline_symbols = 'fancy'

"
noremap ; :
noremap : ;


""" unite.vim
" 入力モードで開始する
" let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#branch#symbol = ' '
let g:airline#extensions#readonly#symbol = ''
let g:airline_linecolumn_prefix = ' '

"quick run
let g:quickrun_config = {
\   "c" : {
\       "exec" : ['gcc -std=c99 %s', './a.out']
\   },
\}

let g:ref_phpmanual_path = $HOME . '/.vim/refs/php-chunked-xhtml'

imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>
