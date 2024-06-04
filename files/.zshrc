export LANG=ja_JP.UTF-8
export GOPATH=$HOME/.go
export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
export PATH="$HOME/bin:$PATH"


## 履歴の保存先
HISTFILE=$HOME/.zsh-history
## メモリに展開する履歴の数
HISTSIZE=100000
## 保存する履歴の数
SAVEHIST=100000

## 補完機能の強化
autoload -U compinit
compinit

## コアダンプサイズを制限
limit coredumpsize 102400
## 出力の文字列末尾に改行コードが無い場合でも表示
unsetopt promptcr
## emacsライクキーバインド設定
bindkey -e

# using zsh-vi-mode plugin (need brew install)
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj

## 色を使う
setopt prompt_subst
## ビープを鳴らさない
setopt nobeep
## 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt long_list_jobs
## 補完候補一覧でファイルの種別をマーク表示
setopt list_types
## サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt auto_resume
## 補完候補を一覧表示
setopt auto_list
## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups
## cd 時に自動で push
setopt auto_pushd
## 同じディレクトリを pushd しない
setopt pushd_ignore_dups
## ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
setopt extended_glob
## TAB で順に補完候補を切り替える
setopt auto_menu
## zsh の開始, 終了時刻をヒストリファイルに書き込む
setopt extended_history
## =command を command のパス名に展開する
setopt equals
## --prefix=/usr などの = 以降も補完
setopt magic_equal_subst
## ヒストリを呼び出してから実行する間に一旦編集
setopt hist_verify
## ファイル名の展開で辞書順ではなく数値的にソート
setopt numeric_glob_sort
## 出力時8ビットを通す
setopt print_eight_bit
## ヒストリを共有
setopt share_history
## 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1
## 補完候補の色づけ
# eval `dircolors`
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
## ディレクトリ名だけで cd
setopt auto_cd
## カッコの対応などを自動的に補完
setopt auto_param_keys
## ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
## スペルチェック
setopt correct
## {a-c} を a b c に展開する機能を使えるようにする
setopt brace_ccl
## Ctrl+S/Ctrl+Q によるフロー制御を使わないようにする
setopt NO_flow_control
## コマンドラインの先頭がスペースで始まる場合ヒストリに追加しない
setopt hist_ignore_space
## コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments
## ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs
## history (fc -l) コマンドをヒストリリストから取り除く。
setopt hist_no_store
## 補完候補を詰めて表示
setopt list_packed
## 最後のスラッシュを自動的に削除しない
setopt noautoremoveslash
# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups
# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space
# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify
# 余分な空白は詰めて記録
setopt hist_reduce_blanks
# 古いコマンドと同じものは無視
setopt hist_save_no_dups
# historyコマンドは履歴に登録しない
setopt hist_no_store
# 補完時にヒストリを自動的に展開
setopt hist_expand
# 履歴をインクリメンタルに追加
setopt inc_append_history

# ヒストリの履歴検索
# autoload history-search-end
# zle -N history-beginning-search-backward-end history-search-end
# zle -N history-beginning-search-forward-end history-search-end
# bindkey "^P" history-beginning-search-backward-end
# bindkey "^N" history-beginning-search-forward-end
## プロンプトの設定

function select-history() {
  BUFFER=$(history -n -r 1 | fzf --exact --reverse --query="$LBUFFER" --prompt="History > ")
  CURSOR=${#BUFFER}
  zle accept-line
}
zle -N select-history       # ZLEのウィジェットとして関数を登録
bindkey '^t' select-history # `Ctrl+r` で登録したselect-historyウィジェットを呼び出す

#alias
alias ls="ls -G"
alias la="ls -hA"
alias ll="ls -lh"
alias lla="ls -lhA"
alias l="ls -CF"

alias vi="$(which nvim)"
alias ctags="/usr/local/bin/ctags"

alias patchd="patch --dry-run"
alias diff="diff -Naur"
alias gitst="git status"
alias grep="grep --color=auto"

# starship
eval "$(starship init zsh)"

# old prompt
# autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null
# 
# function rprompt-git-current-branch {
#         local name st color gitdir action
#         if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
#                 return
#         fi
# 
#         name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
#         if [[ -z $name ]]; then
#                 return
#         fi
# 
#         gitdir=`git rev-parse --git-dir 2> /dev/null`
#         action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"
# 
# 	if [[ -e "$gitdir/prompt-nostatus" ]]; then
# 		echo "$name$action"
# 		return
# 	fi
# 
#         st=`git status 2> /dev/null`
# 	if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
# 		color=%F{white}%f
# 	elif [[ -n `echo "$st" | grep "^# Changes to be committed"` ]]; then
# 		color=%F{green}%f
# 	elif [[ -n `echo "$st" | grep "^# Untracked\|^# Changes not"` ]]; then
#                 color=%F{red}%f
#         fi
# 
#         echo "$color$name$action%f%b "
# }



#autoload -Uz colors; colors
#PROMPT="%{${fg[yellow]}%}%(!.#.$) %{${reset_color}%}"
#PROMPT='[`rprompt-git-current-branch`]%{${fg[yellow]}%}%(!.#.$) %{${reset_color}%}'
#PROMPT='[`rprompt-git-current-branch`]'
#PROMPT="%{${fg[blue]}%}%(!.#.$) %{${reset_color}%}"
#PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
#SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
#RPROMPT="%{${fg[yellow]}%}[%~]%{${reset_color}%}"

