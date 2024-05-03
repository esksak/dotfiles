syntax on
language en_US.UTF-8

set langmenu=en_US.UTF-8
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac "↑文字化け対策
set nocompatible "vi互換モードにしない。プラグインが動かなくなることがあるため。pluginの設定をするより前（先頭に書く必要がある。
set relativenumber " 行数の表示
set cursorline
set display=lastline "長い行も折り返して表示
set cmdheight=2
set showmatch " 対応する括弧を表示
set matchtime=1 " 括弧を表示する時間を100msecに設定
set list " listcharsで指定されたものを表示しない
set listchars=eol:↲,tab:>\ ,extends:❯,precedes:❮
set confirm " 保存するか？の確認表示
set hidden "保存されていないファイルがあっても別のファイルを開くことが出来る
set autoread "外部で変更されたファイルがある場合は読み込み直す
set hlsearch "highlight search
set incsearch "increment search
set ignorecase
set smartcase  " 大文字を検索に入れた場合は、ignorecaseしない
set showcmd " 入力中のコマンドを表示
set gdefault " 置換のときにデフォルトでgオプションをつける
set expandtab " tabを空白に置き換え
set tabstop=2 " tab文字の幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set clipboard=unnamed,unnamedplus " OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set history=10000
set backupdir=$HOME/vimbackup
set whichwrap=b,s,<,>,[,] " 次の行に飛べるコマンド一覧
set nowrapscan " 検索時にトップに戻らない
set laststatus=2 " status行を常に表示
set statusline=%t       "tail of the filename
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%=      "left/right separator
set statusline+=%l/%L,  "cursor line/total lines
set statusline+=%c      "cursor column
set statusline+=\ %P    "percent through fil
set statusline+=%y      "filetype
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set noswapfile
set wildmenu "コマンドラインの補完候補を出してくれる
set wildmode=longest,list,full " 一回目は最大で補完出来るものを自動で補完、二回目はlistで表示、三回目はtabで順番に補完対象を選べる
set tags=./.tags; "ctagの設定。もう少し調べる必要あり
set background=light
set tags=./tags,tags;$HOME " 'tags'という名前のファイルを探しに行く。ない場合は、$HOMEまで再帰的に遡る（upward-searchというvimの機能）。;$HOMEの記述の仕方。
set matchpairs+=<:>,（:）,「:」,『:』,［:］,【:】,〈:〉,《:》,｛:｝,〔:〕 "Vimでは括弧にカーソルをあわせると対応する括弧をハイライトしてくれますが、標準では対応していない括弧もハイライトできるようにします。
" ↓なんかだめだった。もとに戻すには set termguicolors&でデフォルトに戻る
"set termguicolors "True Color（24bit）表示に対応します。使っているターミナルアプリがTrue Colorに対応している必要があります
set breakindent " wrapで折り返された行を、同じインデントで表示します。
set signcolumn=yes " aleやvim-gitgutterを使っていると行番号の左側がガタガタしてアレなんですが、これを設定するとおとなしくなります。
set splitbelow "splitやvsplitを実行したときに画面のどちら側に新規ペインを開くかどうかを設定できます。
set splitright " splitbelowで新規ペインを下に、splitrightで新規ペインを右に作成するようにしています。
set lazyredraw " 描画速度が速くなります。
set ttyfast " 描画速度が速くなります。

" for ack.vim use ag for executable
let g:ackprg = '/usr/local/bin/ag --vimgrep'

" leader
let  mapleader = "\<Space>"
" keymaps
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <S-j> 5j
nnoremap <S-k> 5k
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap :sour :source ~/.vimrc

" display path to the command output and copy it to the clipboard also
nnoremap :path<CR> :redir @*  <bar> echo @% <bar> redir END<CR>
nnoremap :fullpath<CR> :redir @* <bar> echo expand('%:p') <bar> redir END<CR>
nnoremap :vnew<CR> :vnew<CR><C-w>L
nnoremap n nzt
nnoremap N Nzt
nnoremap <Leader>sa :wa<CR>
nnoremap <Tab> >l
nnoremap <S-Tab> <l
nnoremap <Leader>r :bufdo! e<CR>
nnoremap <Leader>e e<CR>

 "emacs like keypmaps
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <C-d> <C-o>x

" keymaps like normal mode
inoremap <C-h> <C-o>gh
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk
inoremap <C-l> <C-o>gl
inoremap <C-^> <C-o>^
inoremap <C-f> <C-o><C-f>
inoremap <C-b> <C-o><C-b>
inoremap <C-u> <C-o>u
inoremap <C-r> <C-o><C-r>
inoremap <silent> jj <Esc>
inoremap {<CR> {}<LEFT>
inoremap [<CR> []<LEFT>
inoremap (<CR> ()<LEFT>
inoremap "<CR> ""<LEFT>
inoremap '<CR> ''<LEFT>
inoremap <<CR> <><LEFT>

" dividing undo history
inoremap <CR> <CR><C-g>u
inoremap <Backspace> <Backspace><C-g>u

" store session
let g:sessions_dir = '~/vim-sessions'
exec 'nnoremap <Leader>ss :mks! ' . g:sessions_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ' . g:sessions_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'

" ウインドウ分割最大化・もとにもどすトグル
let g:toggle_window_size = 0
function! ToggleWindowSize()
  if g:toggle_window_size == 1
    exec "normal \<C-w>="
    let g:toggle_window_size = 0
  else
    :resize
    :vertical resize
    let g:toggle_window_size = 1
  endif
endfunction
nnoremap <Leader>z :call ToggleWindowSize()<CR>


if exists('g:vscode')
  nnoremap <Leader>jf <Cmd>lua require('vscode-neovim').action('workbench.action.quickOpen')<CR>

endif
