"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let mapleader = ","
vnoremap <Leader>y "+y
vnoremap <Leader>p "+p

if has('win32')
	exec ":lan mes en"
	exec ":colorscheme molokai_dark"
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
	behave mswin
endif
" Start of NeoBundle---------------------------------------
" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/
set runtimepath+=~/.vim/bundle/YouCompleteMe/

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

NeoBundle 'Valloric/YouCompleteMe'
" YCM 补全菜单配色
" 菜单
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=1
" global conf
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>, <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全         
let g:ycm_seed_identifiers_with_syntax=1
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
noremap <leader>jd :YcmCompleter GoToDefinition<CR>

NeoBundle 'jiangmiao/auto-pairs'
let g:AutoPairsFlyMode = 0
NeoBundle 'davidhalter/jedi-vim'
let s:hooks = neobundle#get_hooks("jedi-vim")
function! s:hooks.on_source(bundle)
  " jediにvimの設定を任せると'completeopt+=preview'するので
  " 自動設定機能をOFFにし手動で設定を行う
  let g:jedi#auto_vim_configuration = 0
  " 補完の最初の項目が選択された状態だと使いにくいためオフにする
  let g:jedi#popup_select_first = 0
endfunction

NeoBundle 'Shougo/vimfiler'
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
" Dependency of vimshell
"NeoBundle 'Shougo/vimproc.vim', {
"\ 'build' : {
"\     'windows' : 'tools\\update-dll-mingw',
"\     'cygwin' : 'make -f make_cygwin.mak',
"\     'mac' : 'make',
"\     'linux' : 'make',
"\     'unix' : 'gmake',
"\    },
"\ }


" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
NeoBundle 'Yggdroot/indentLine'
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_char = '¦'

"NeoBundle 'Chiel92/vim-autoformat'
"let g:formatter_yapf_sytle = 'pep8'


NeoBundle 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

NeoBundle 'godlygeek/tabular'

NeoBundle 'derekwyatt/vim-fswitch'
nnoremap <silent><leader>sw :FSHere<CR>
nnoremap <silent><leader>sr :FSSplitRight<CR>

NeoBundle 'derekwyatt/vim-protodef'
let g:disable_protodef_sorting=1
let g:protodefprotogetter='~/.vim/bundle/protodef/pullproto.pl'

NeoBundle 'kshenoy/vim-signature'
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

NeoBundle 'scrooloose/nerdcommenter'

NeoBundle 'SirVer/ultisnips'
let g:UltiSnipsSnippetDirectories=["neosnippet-snippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

NeoBundle 'majutsushi/tagbar'
let tagbar_right=1
let tagbar_width=32
let g:tagbar_compact=1
nnoremap <F8> :TagbarToggle<CR> 

NeoBundle 'kevinw/pyflakes-vim'
NeoBundle 'python-rope/ropevim'

NeoBundle 'mileszs/ack.vim'
NeoBundle 'dyng/ctrlsf.vim'

NeoBundle 'terryma/vim-multiple-cursors'

NeoBundle 'vim-scripts/TaskList.vim'
nnoremap <Leader>td :TaskList<CR>

" Required:
call neobundle#end()

" Required:
filetype plugin indent on
filetype on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
" release autogroup in MyAutoCmd
augroup MyAutoCmd
  autocmd!
augroup END

autocmd BufWritePost $MYVIMRC source $MYVIMRC

"GUI simplify-----------------------------------0
set guioptions-=T
"set guioptions-=m

"Accessarity------------------------------------
set background=dark
set t_Co=256
colorscheme molokai_dark
set laststatus=2
set ruler
set cursorline
set cursorcolumn
set guifont=Courier\ New:h13
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト (2013-07-03 14:30 修正）
set nowrap
set wildmenu            " autocomplete vim commands

"Coding-----------------------------------------
let g:pymode_python = 'python3'
set encoding=utf-8
set fileencodings=utf-8,gbk,latin-1
syntax on
"compile
nmap <Leader>m :w<CR>:!smvn -b lmake<CR>

" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
"cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
"cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

"Indention--------------------------------------
filetype indent on
set expandtab
set shiftround          " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set tabstop=4
set shiftwidth=4
set softtabstop=4

"Fold------------------------------------------
set foldmethod=indent
"set foldmethod=syntax

set infercase           " 補完時に大文字小文字を区別しない
"set virtualedit=all     " カーソルを文字が存在しない部分でも動けるようにする
"set hidden              " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く
set showmatch           " 対応する括弧などをハイライト表示する
set matchtime=3         " 対応括弧のハイライト表示を3秒にする

" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>

" バックスペースでなんでも消せるようにする
set backspace=indent,eol,start

" Swapファイル？Backupファイル？前時代的すぎ
" なので全て無効化する
set nowritebackup
set nobackup
set noswapfile

set list                " 不可視文字の可視化
set number              " 行番号の表示
set textwidth=0         " 自動的に改行が入るのを無効化
set colorcolumn=80      " その代わり80文字目にラインを入れる

" 前時代的スクリーンベルを無効化
set t_vb=
set novisualbell

" デフォルト不可視文字は美しくないのでUnicodeで綺麗に
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:¤

" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>
nnoremap <space> za

" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" vを二回で行末まで選択
vnoremap v $

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tm :tabmove<CR>
" T + ? で各種設定をトグル
nnoremap [toggle] <Nop>
nmap T [toggle]
nnoremap <silent> [toggle]s :setl spell!<CR>:setl spell?<CR>
nnoremap <silent> [toggle]l :setl list!<CR>:setl list?<CR>
nnoremap <silent> [toggle]t :setl expandtab!<CR>:setl expandtab?<CR>
nnoremap <silent> [toggle]w :setl wrap!<CR>:setl wrap?<CR>

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

nnoremap <leader>vs :VimShellTab<CR>
" Fast open vimrc filv
nnoremap <leader>ee :e ~/.vimrc<CR>

nnoremap <leader>vf :VimFiler -split -simple -winwidth=35 -no-quit<CR>

" make, grep などのコマンド後に自動的にQuickFixを開く
autocmd MyAutoCmd QuickfixCmdPost make,grep,grepadd,vimgrep copen

" QuickFixおよびHelpでは q でバッファを閉じる
autocmd MyAutoCmd FileType help,qf nnoremap <buffer> q <C-w>c

" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %

" :e などでファイルを開く際にフォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
  if !isdirectory(a:dir) && (a:force ||
        \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction
autocmd MyAutoCmd BufWritePre * call s:mkdir(expand('<afile>:p:h'), v:cmdbang)

" vim 起動時のみカレントディレクトリを開いたファイルの親ディレクトリに指定
autocmd MyAutoCmd VimEnter * call s:ChangeCurrentDir('', '')
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction
