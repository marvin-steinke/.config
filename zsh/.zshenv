export ZDOTDIR="$HOME/.config/zsh/"
function standalone() { (nohup $1 & disown) &>/dev/null || true }
