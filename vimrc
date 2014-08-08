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
"" }}}

""  Installation {{{
NeoBundle 'Shougo/vimproc', {
\   'build': {
\       'windows' : 'make -f make_mingw32.mak',
\       'cygwin'  : 'make -f make_cygwin.mak',
\       'mac'     : 'make -f make_mac.mak',
\       'unix'    : 'make -f make_unix.mak'
\ }}

NeoBundle 'Shougo/neocomplete'
NeoBundle 'nicoraffo/conque'
NeoBundle 'vim-scripts/vim-auto-save'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neosnippet-snippets' 
NeoBundle 'Shougo/neosnippet.vim' 
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kana/vim-textobj-entire'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'mattn/excitetranslate-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'natw/vim-pythontextobj'
NeoBundle 'rcmdnk/vim-markdown' 
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-textobj-between'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tyru/caw.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'vim-scripts/Align'
NeoBundle 'scrooloose/syntastic'
"" }}}

""  Setting for Plugins {{{
"" ALign
let g:Align_xstrlen = 3 " for japanese environment"

"" auto-save
let g:auto_save = 1

""  NeoComplete {{{
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl =
\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

" For smart TAB completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ neocomplete#start_manual_complete()
  function! s:check_back_space() "
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction
""}}}

""  neosnippet {{{
let g:neosnippet#snippets_directory='~/.vim/snippets/'
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

" use head match for neocomplete
let g:neocomplete#enable_fuzzy_completion = 0"}}}

"" Quickrun {{{
let g:quickrun_config = {}
let g:quickrun_config['python'] = {
\   'command': 'python3',
\   'exec':    ['%o %c %s', 'pep8 %s']
\ }

" test用の設定
" testからはじまるpythonファイルをテストコードとする 
autocmd BufWinEnter,BufNewFile test*.py set filetype=python.test
autocmd BufWinEnter,BufNewFile *test.py set filetype=python.test

" quickrun.vim 用設定 
let g:quickrun_config['python.test'] = {'command': 'nosetests3', 'exec': ['%c -v %s']}
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

"" Git {{{
nnoremap <space>ga :Gdiff<cr>
nnoremap <space>gs :Gstatus<cr>
nnoremap <space>gl :Glog<cr>
nnoremap <space>ga :Gwrite<cr>
nnoremap <space>gc :Gcommit<cr>
nnoremap <space>gC :Git commit --amend<cr>
nnoremap <space>gb :Gblame<cr>
" }}}

""" excitetranslate (translate)
nnoremap <silent>& :<c-u>ExciteTranslate<cr>

""" vimdoc-ja
helptags ~/.vim/bundle/vimdoc-ja/doc
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

"" 矢印キー
nnoremap <LEFT>  :tabnext<cr>
nnoremap <RIGHT> :tabprevious<cr>
nnoremap <UP>    <NOP>
nnoremap <DOWN>  <NOP>

" Backspaceでなんでも消せる
set backspace=indent,eol,start

""" filetypeの変更
autocmd BufNewFile,BufRead *.tex  setfiletype tex
autocmd BufNewFile,BufRead *.sage setfiletype python
autocmd BufNewFile,BufRead *.markdown setfiletype markdown

""" Work Flowのファイルを表示
command! Flow :e ~/Dropbox/flow.markdown

""" backupをとらない
set nowritebackup
set nobackup
set noswapfile

" 終了するときにファイル情報を保存する
autocmd BufWinLeave *? silent mkview
autocmd BufWinEnter *? silent loadview

" "%"の拡張
runtime macros/matchit.vim
runtime macros/editexisting.vim

" 行番号を表示
set number      

" makeファイルで無ければ,タブを展開
if expand("%") != "Makefile"
    set expandtab
endif

" Tabは4文字文の空白とする
set tabstop=4
set softtabstop=4
set shiftwidth=4
" tex形式では2文字分
autocmd FileType tex set tabstop=2
autocmd FileType tex set softtabstop=2
autocmd FileType tex set shiftwidth=2

"" statusbarの設定
" 常にstatuslineを表示する
set laststatus=2
" formatの設定
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]

" multibyte文字の間に空白を挿入しない
" set formatoptions+=mM   

" 行の長さは80文字以内
set textwidth=80        

""" 賢いインデント
set autoindent
set smartindent
"" commentを自動で挿入しない
set formatoptions-=r

" incsearch
set incsearch

" すべての数値を10進数と考える"
set nrformats =

" 上下に三文字ずつ表示させる.
set scrolloff=3

" vimscriptではfoldの方法はmarker
autocmd FileType vim set foldmethod=marker

" 文字のサーチの拡張
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

" <c-\>で新しいTabを開く
nnoremap <c-\> :tabnew<cr>

" <Leader>.で.vimrcを開く
nnoremap <leader>. :tabnew ~/.vimrc<cr>
nnoremap <Leader>? :source ~/.vimrc<cr>

""" <c-c>で次の行に移動してnormalmodeに
nnoremap <silent><c-c> o<esc>

""" 文字列削除のためのコマンドのmap
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


""" 検索などで飛んだら,そこを真ん中に
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap G Gzz

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

""" 今開いているディレクトリをroot dirに
command! Cd :cd %:h
command! CdSnip :cd ~/.vim/snippets/
