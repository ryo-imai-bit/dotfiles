source $VIMRUNTIME/defaults.vim

set fileencodings=utf-8,cp932
colorscheme iceberg
set number
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

" autocomlete parenthis
inoremap {<CR> {<CR>}<Esc>ko
inoremap (<CR> (<CR>)<Esc>ko
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ' ''<Left>
inoremap " ""<Left>

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
command! Bd :bp | :sp | :bn | :bd "ウィンドウを閉じずにバッファを閉じる

" 補完表示時のEnterで改行をしない
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
" coc.nvim
"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" end
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"automatically open cwindow when vimgrep or grep called
" autocmd QuickFixCmdPost *grep* cwindow 

" be accustomed to key bindings in vim
map <up> <nop>
map <down> <nop>
map <left> <nop>>
map <right> <nop>

filetype plugin indent on
syntax enable "color schemaが読まれた後

set rtp+=/opt/homebrew/opt/fzf
