# vars
export ZSH="$HOME/.config/oh-my-zsh"
export EDITOR="nvim"
export VISUAL="nvim"
export PATH="$PATH:$HOME/.scripts:/home/marvin/.local/bin"
export FZF_DEFAULT_COMMAND="rg \
                            --files \
                            --no-ignore-vcs \
                            --hidden \
                            --glob '!{.git,node_modules,.cache,.minecraft,.gnupg,.mozilla,.local,.npm}' \
                            "
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND="fd \
                            --type d \
                            --hidden \
                            --follow \
                            --exclude '{.git,node_modules,.cache,.minecraft,.gnupg,.mozilla,.local,.npm,.pki}' \
                            "
export LC_ALL=en_US.UTF-8
export HISTFILE="$HOME/.config/zsh/.zsh_history"
export LESSHISTFILE=-

# theme and color
eval "$(dircolors $HOME/.config/zsh/dircolors.gruvbox)"
ZSH_THEME="agnoster"

# plugins
plugins+=(git)
plugins+=(vi-mode)
plugins+=(fzf)
plugins+=(fzf-tab)
source $ZSH/oh-my-zsh.sh

# vim
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true

# bindings
bindkey ^f fzf-file-widget
bindkey ^h fzf-history-widget
bindkey ^j fzf-cd-widget
bindkey ^p up-line-or-search
bindkey ^n down-line-or-search

# functions & alias
function standalone() { (nohup $1 & disown) &>/dev/null || true }
function open() { (nohup xdg-open $1 & disown) &>/dev/null || true }
function pdfcompress ()
{
    gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.3 -dPDFSETTINGS=/printer -dSubsetFonts=true -dColorImageDownsampleType=/Bicubic -dColorImageResolution=144 -dGrayImageResolution=144 -dMonoImageDownsampleType=/Bicubic -sOutputFile=$1.compressed.pdf $1;
}
alias .="clear;ls -AlhX"
function chpwd() { . }
alias disk="echo;df -h /dev/nvme0n1p2"
alias ..="cd .."
alias usb="cd /run/media/marvin/"
alias d="cd $HOME/Downloads/"
alias q="exit"
alias vim="nvim"
alias update="yay;pacwall"
alias untar="tar -xzvf"
