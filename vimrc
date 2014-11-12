""" Plugins {{{
""  NeoBundle {{{
set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

filetype plugin indent on     " Required!

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
          \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
              "finish
endif
" }}}

"  Installation {{{
NeoBundle 'Shougo/vimproc', {
\   'build': {
\       'windows' : 'make -f make_mingw32.mak',
\       'cygwin'  : 'make -f make_cygwin.mak',
\       'mac'     : 'make -f make_mac.mak',
\       'unix'    : 'make -f make_unix.mak'
\ }}

" NeoBundle 'Shougo/neocomplete'
NeoBundle 'rhysd/committia.vim'
NeoBundle 'nicoraffo/conque'
NeoBundle 'cohama/agit.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'osyo-manga/vim-reanimate'
NeoBundle 'payneseu/YankRing'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'yuratomo/w3m.vim'
NeoBundle 'deris/vim-fitcolumn'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'vim-scripts/vcscommand.vim'
command! VAdd :VCSAdd<cr>
command! VDiff :VCSDiff<cr>
command! VStatus :VCSStatus<cr>
command! VLog :VCSLog<cr>
command! VCommit :VCSCommit<cr>
NeoBundle 'mhaig/vim-blockdiag-series'
NeoBundle 'vim-scripts/vim-auto-save'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'nvie/vim-flake8'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'yegappan/mru'
" NeoBundle 'kana/vim-smartinput'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-textobj-entire'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'mattn/excitetranslate-vim'
NeoBundle 'bps/vim-textobj-python'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-textobj-between'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tyru/caw.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'vim-scripts/Align'
NeoBundle 'yassu/todo-env.vim'
" }}}

""  Setting for Plugins {{{
"" ALign
let g:Align_xstrlen = 3 " for japanese environment"

" This is default key mapping
imap <C-k>  <Plug>(fitcolumn-abovecolumn)

" w3m
nnoremap <Leader>w :W3m<Space>
let g:w3m#homepage="http://www.google.co.jp/"


"" VimFiler
nnoremap <Leader>f :VimFiler<cr>

"" auto-save
let g:auto_save = 1

" reanimate
command! -nargs=1 SaveS :ReanimateSave <args>
command! -nargs=1 LoadS :ReanimateLoad <args>

" previm
let g:previm_enable_realtime=1
autocmd FileType markdown nnoremap <buffer> <Leader>P :PrevimOpen<cr>

" flake8
autocmd FileType python command! FK :call Flake8()<cr>

" ""  NeoComplete {{{
" " Disable AutoComplPop.
" let g:acp_enableAtStartup = 0
" " Use neocomplete.
" let g:neocomplete#enable_at_startup = 1
" " Use smartcase.
" let g:neocomplete#enable_smart_case = 1
" " Set minimum syntax keyword length.
" let g:neocomplete#sources#syntax#min_keyword_length = 3
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"
" " Define dictionary.
" let g:neocomplete#sources#dictionary#dictionaries = {
"     \ 'default' : '',
"     \ 'vimshell' : $HOME.'/.vimshell_hist',
"     \ 'scheme' : $HOME.'/.gosh_completions'
"     \ }
"
" " Define keyword.
" if !exists('g:neocomplete#keyword_patterns')
"     let g:neocomplete#keyword_patterns = {}
" endif
" let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"
" " Plugin key-mappings.
" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()
"
" " Recommended key-mappings.
" " <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   return neocomplete#close_popup() . "\<CR>"
"   " For no inserting <CR> key.
"   "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
" endfunction
" " <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplete#close_popup()
" inoremap <expr><C-e>  neocomplete#cancel_popup()
" " Close popup by <Space>.
" "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
" " Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"
" " Enable heavy omni completion.
" if !exists('g:neocomplete#sources#omni#input_patterns')
"   let g:neocomplete#sources#omni#input_patterns = {}
" endif
" if !exists('g:neocomplete#force_omni_input_patterns')
"   let g:neocomplete#force_omni_input_patterns = {}
" endif
"
" " For perlomni.vim setting.
" " https://github.com/c9s/perlomni.vim
" let g:neocomplete#sources#omni#input_patterns.perl =
" \ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
"
" " For smart TAB completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
"         \ <SID>check_back_space() ? "\<TAB>" :
"         \ neocomplete#start_manual_complete()
"   function! s:check_back_space() "
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~ '\s'
"   endfunction
" ""}}}
"
" ""  neosnippet {{{
imap <c-k> <Plug>(neosnippet_expand_or_jump)
smap <c-k> <Plug>(neosnippet_expand_or_jump)
xmap <c-k> <Plug><Plug>(neosnippet_expand_target)

" Super tab like snippets behavior
imap <expr><tab> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible()? "<c-n>": "\<tab>"
smap <expr><tab> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<tab>"
" for snippet_complete marker
if has("conceal")
    set conceallevel=2
endif

" " use head match for neocomple
let g:neosnippet#disable_runtime_snippets = {'_': 1}
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/snippets/'
let g:neocomplete#enable_fuzzy_completion = 0 "}}}

"" Quickrun {{{
let g:quickrun_config = {}

" pythonのtest用の設定
" testからはじまるpythonファイルをテストコードとする 
autocmd BufWinEnter,BufNewFile test*.py set filetype=python.test
autocmd BufWinEnter,BufNewFile *test.py set filetype=python.test

" task file
nnoremap <Leader>t :e ~/WorkSpace/todo<cr>
autocmd BufWinEnter,BufNewFile todo set filetype=todo
let g:todo_env_fold_child = 0
let g:todo_env_date_format = "%Y/%m/%d %H:%M"

" 全体の設定
let g:quickrun_config = {
\   "_": {
\       "runner": "vimproc",
\   }
\}

" quickrun.vim 用設定 
let g:quickrun_config['python.test'] = {'command': 'nosetests', 'exec': ['%c -v %s']}
let g:quickrun_config['python'] = {'command': 'python3'}

" blockdiag
let g:quickrun_config['blockdiag'] = {
            \'command': 'blockdiag',
            \'exec': ['%c -a %s -o %{expand("%:r")}.png', 'display %{expand("%:r")}.png'],
            \'outputter':'message',
            \}

let g:quickrun_config['tex'] = {
            \'command': 'platex',
            \'exec': ['%c %s && dvipdfmx %{expand("%:r").dvi && evince'],
            \'outputter': 'message'
            \}
"" }}}

"" Conque {{{
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CWInsert = 1
noremap <silent><Space>sh :ConqueTermTab zsh<cr>
noremap <silent><Space>tsh :ConqueTermTab zsh<cr>
noremap <silent><Space>vsh :ConqueTermVSplit zsh<cr>
noremap <silent><Space>py :ConqueTermTab ipython3<cr>
noremap <silent><Space>tpy :ConqueTermTab ipython3<cr>
noremap <silent><Space>vpy :ConqueTermVSplit ipython3<cr>
 
function! s:delete_ConqueTerm(buffer_name)
    let term_obj = conque_term#get_instance(a:buffer_name)
    call term_obj.close()
endfunction
autocmd BufWinLeave zsh\s-\s? call <SID>delete_ConqueTerm(expand('%'))
nnoremap <Space>vsh :ConqueTermVSplit zsh
"" }}}

"" comment {{{
" <Leader>cでコメントアウトと解除を行う
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)
"" }}}

"" {{{ nerdtree
" <Leader>NでNerdTreeを表示
nnoremap <Leader>N :NERDTree<cr>
" 隠しファイルをデフォルトで表示
let NERDTreeShowHidden=1
"" }}}

"" unite {{{
" ,umで最近開いたファイルを表示
nnoremap <silent> ,um :<c-u>Unite file_mru<cr>
"" }}}


""" openbrowser
nmap <Leader>w <Plug>(openbrowser-open)

""" excitetranslate (translate)
nnoremap <silent>& :<c-u>ExciteTranslate<cr>

""" vimdoc-ja
helptags ~/.vim/bundle/vimdoc-ja/doc
autocmd FileType help nnoremap <buffer> q :q<cr>
""" }}}
""" }}}

""" カラースキーム
colorscheme evening

""" 基本setting
filetype plugin indent on
filetype plugin on
filetype indent on
syntax on
set clipboard=unnamedplus


"" 矢印キー {{{
nnoremap <LEFT>  :tabnext<cr>
nnoremap <RIGHT> :tabprevious<cr>
nnoremap <UP>    <NOP>
nnoremap <DOWN>  <NOP>
"" }}}

" Backspaceでなんでも消せる
set backspace=indent,eol,start

""" filetypeの変更 {{{
autocmd BufNewFile,BufRead *.tex  setfiletype tex
autocmd BufNewFile,BufRead *.sage setfiletype python
autocmd BufNewFile,BufRead *.markdown setfiletype markdown
autocmd BufNewFile,BufRead *.diag setfiletype blockdiag
""" }}}

""" Work Flowのファイルを表示
command! Flow :e ~/Dropbox/flow.markdown

""" backupをとらない {{{
set nowritebackup
set nobackup
set noswapfile
""" }}}

" 終了するときにファイル情報を保存する {{{
autocmd BufWinLeave *? silent mkview
autocmd BufWinEnter *? silent loadview
" }}}

" "%"の拡張 {{{
runtime macros/matchit.vim
runtime macros/editexisting.vim
" }}}

" 行番号を表示
set number


" expandtab
set expandtab

" }}}

" Tab文字の設定 {{{
" Tabは4文字文の空白とする
set tabstop=4
set softtabstop=4
set shiftwidth=4
" }}}

"" statusbarの設定 {{{
" 常にstatuslineを表示する
set laststatus=2
" formatの設定
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]
"" }}}


""" 賢いインデント {{{
set autoindent
set smartindent
""" }}}
"" commentを自動で挿入しない
set formatoptions-=r

" incsearch
set incsearch

" すべての数値を10進数と考える"
set nrformats =

" 上下に三文字ずつ表示させる.
set scrolloff=3

" 文字のサーチの拡張 {{{
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
nmap <leader>* :execute 'noautocmd vimgrep /\V' . substitute(escape(expand("<cword>"), '\'), '\n', '\\n', 'g') . '/ **'<CR>
vmap <leader>* :<C-u>call <SID>VSetSearch()<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>
" }}}

" <c-\>で新しいTabを開く
nnoremap <c-\> :tabnew<cr>

" vimrcの使い勝手をよくする {{{
nnoremap <leader>. :tabnew ~/dotfiles/vimrc<cr>
nnoremap <Leader>? :source ~/dotfiles/vimrc<cr>
" }}}

""" <c-c>で次の行に移動してnormalmodeに
nnoremap <silent><c-c> o<esc>

""" 文字列削除のためのコマンドのmap {{{
nnoremap <silent>c_ ct_
nnoremap <silent>d_ dt_
nnoremap <silent>c) ct)
nnoremap <silent>d) dt)
nnoremap <silent>c} ct}
nnoremap <silent>d} dt}
nnoremap <silent>c] ct]
nnoremap <silent>d] dt]
nnoremap <silent>d' dt'
nnoremap <silent>c' ct'
nnoremap <silent>d" dt"
nnoremap <silent>c" ct"
nnoremap <silent>d. dt.
nnoremap <silent>c. ct.
nnoremap <silent>d\ d$
nnoremap <silent>c$ d$a
nnoremap <silent>c\ c$
""" }}}

""" 検索などで飛んだら,そこを真ん中に {{{
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap G Gzz
""" }}}

""" memo {{{
" <Space>mでメモを開く
nnoremap <Space>m :tabnew ~/Dropbox/memo.markdown<cr>
""" }}}

""" Tabの設定 {{{
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction


" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ
""" }}}

"" 縦分割でhelpを表示
nnoremap <Space>h :<c-u>vertical help<Space>

""" view new line
set list
set listchars=eol:<

""" 今開いているディレクトリをroot dirに
command! Cd :cd %:h
command! CdSnip :cd ~/.vim/snippets/
set shell=/bin/bash

set conceallevel=0

