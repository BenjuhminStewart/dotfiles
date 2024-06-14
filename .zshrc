USE_OMP=false
USE_OMZ=false

export PATH=$HOME/bin:/usr/local/bin:$PATH
# add nim to path
export PATH=/Users/benjamin/.nimble/bin:$PATH
source ~/.zsh/themes/ben.zsh-theme

setopt autocd
zle_highlight=('paste:none')
unsetopt BEEP
KEYTIMEOUT=50
autoload colors; colors

# SET TILE
echo -en "\033]0;${PWD/#$HOME/~}\007"
DISABLE_AUTO_TITLE="true"
chpwd() {
  [[ -t 1 ]] || return
  case $TERM in
    sun-cmd) print -Pn "\e]l%~\e\\"
      ;;
    *xterm*|rxvt|(dt|k|E)term) print -Pn "\e]2;%~\a"
      ;;
  esac
}
        
# ALIASES
source ~/.zsh/aliases.zsh

# Source Custom Scripts
for file in $(find ~/dotfiles/.zsh/functions -type f); 
do
    source $file; 
done

# Source Plugins
# source ~/.zsh/plugins

# Source Syntax Highlighting
source ~/.zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Source Autosuggestions
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Source Z
source ~/.zsh/plugins/zsh-z/zsh-z.plugin.zsh

# Source Completions
source ~/.zsh/plugins/zsh-completions/zsh-completions.plugin.zsh

# Source Zsh Bat
source ~/.zsh/plugins/zsh-bat/zsh-bat.plugin.zsh

# Source Vi Mode
function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
}

function my_custom_widget() {
  exit
}

function zvm_after_lazy_keybindings() {
  zvm_define_widget my_custom_widget
  bindkey -M vicmd ':' my_custom_widget
  bindkey -M visual 'n' your_visual_widget
}
source ~/.zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH=$PATH:/Users/benjamin/.spicetify

# opam configuration
[[ ! -r /Users/benjamin/.opam/opam-init/init.zsh ]] || source /Users/benjamin/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

[ -f "/Users/benjamin/.ghcup/env" ] && source "/Users/benjamin/.ghcup/env" # ghcup-env

# add go to path
export PATH="$PATH:$HOME/go/bin"
# bun completions
[ -s "/Users/benjamin/.bun/_bun" ] && source "/Users/benjamin/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# qmk is at ~/.local/bin/qmk
export PATH="$HOME/.local/bin:$PATH"

# rust is at ~/.cargo/bin
export PATH="$HOME/.cargo/bin:$PATH"

# Use fd instead of fzf

export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
  fd --hidden --follow --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude .git . "$1"
}

source ~/fzf-git.sh/fzf-git.sh
export JAVA_HOME=/opt/jdk-22.0.1.1

export GOBIN=$HOME/go/bin
