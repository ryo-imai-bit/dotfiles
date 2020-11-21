source $VIMRUNTIME/defaults.vim

set fileencodings=utf-8,cp932
colorscheme iceberg
set relativenumber
set cursorline
set hlsearch
set incsearch
if has('persistent_undo')
	let undo_path = expand('~/.vim/undo')
	exe 'set undodir=' .. undo_path
	set undofile
endif
"mastring vim undofile setting
"set undo file
"if !isdirectory(expand("$HOME/.vim/undodir"))
"   call mkdir(expand("$HOME/.vim/undodir"), "p")
"endif
"set undodir=$HOME/.vim/undodir
set helplang=ja
set smartindent
set clipboard+=unnamed
set tabstop=4
set shiftwidth=4
set autoindent
set backspace=2
set expandtab
set laststatus=2
set wildmenu
set wildmode=list:longest,full "最長マッチまで補完してから自動保管メニューを開く
set ignorecase
set smartcase
" Escを2回押すとハイライトを消す
nnoremap <Esc><Esc> :nohlsearch<CR>
" <Leader>というプレフィックスキーにスペースを使用する
let g:mapleader = "\<Space>"
" スペース + wでファイル保存
nnoremap <Leader>w :w<CR>
"gorillaさん設定 dein.vim
" dein.vim settings {{{
" install dir {{{
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }}}

" dein installation check {{{
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }}}

" begin settings {{{
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " .toml file
  let s:rc_dir = expand('~/.vim')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'

  " read toml and cache
  call dein#load_toml(s:toml, {'lazy': 0})

  " end settings
  call dein#end()
  call dein#save_state()
endif
" }}}

" plugin installation check {{{
if dein#check_install()
  call dein#install()
endif
" }}}

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}
" tmuxでvimのcolorがうまくいかなかったので追記
set background=dark
set t_Co=256
"
"vim-airline
let g:airline#extensions#tabline#enabled = 1
"vim-airlinetheme
let g:airline_theme='light'
"vim-prettier
packloadall

"phpactor
""""""""""""""""""""
" 画面を分割して定義元へのジャンプ
function! DefinitionJumpWithPhpactor()
    split
    call phpactor#GotoDefinition()
endfunction
" カーソル下のクラスやメンバの定義元にジャンプ
nmap <silent><Leader>o      :<C-u>call phpactor#GotoDefinition()<CR>
" useの補完
nmap <silent><Leader>u      :<C-u>call phpactor#UseAdd()<CR>
" コンテキストメニューの起動(カーソル下のクラスやメンバに対して実行可能な選択肢を表示してくれます)
nmap <silent><Leader>mm     :<C-u>call phpactor#ContextMenu()<CR>
" ナビゲーションメニューの起動(クラスの参照元を列挙したり、他ファイルへのジャンプなど)
nmap <silent><Leader>nn     :<C-u>call phpactor#Navigate()<CR>
" オムニ補完
autocmd FileType php setlocal omnifunc=phpactor#Complete
" split → jump
nmap <silent><C-w><Leader>o :<C-u>call DefinitionJumpWithPhpactor()<CR>
" カーソル下のクラスや変数の情報を表示する
" 他のエディタで、マウスカーソルをおいたときに表示されるポップアップなどに相当
vmap <silent><Leader>hh     :<C-u>call phpactor#Hover()<CR>

""""""""""""""""""""

filetype plugin indent on
syntax enable "color schemaが読まれた後
