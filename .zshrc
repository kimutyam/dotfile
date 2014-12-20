#補完機能
autoload -U compinit
compinit

# プロンプトに色をつける
autoload -U colors
colors

# VCSの情報を取得するzshの関数
autoload -Uz vcs_info

# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
	psvar=()
	LANG=en_US.UTF-8 vcs_info
	[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
RPROMPT=" %~ %1(v|%F{green}%1v%f|)"

#文字コード
export LANG=ja_JP.UTF-8

#エイリアス
alias ll='ls -l'
alias la='ls -a'
alias lsa='ls -ld .*'
alias hs='history'
alias vi='vim'
alias rm='rm -i'


#プロンプト
PROMPT='%m%# '
#RPROMPT=' %~'

#ヒストリー
HISTSIZE=2000
SAVEHIST=10000
HISTFILE=~/.zhistory

#スタック
DIRSTACKSIZE=20

#キーバインド
#bindkey -v

setopt auto_cd
setopt auto_pushd pushd_ignore_dups
#setopt correct
setopt share_history extended_history inc_append_history
setopt nobeep

#色の設定
export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'

#todo doxygenとAndroidは別管理にした方がいい
PATH=${PATH}:/usr/local/share:/usr/share/php:/:/Applications/Doxygen.app/Contents/Resources/
