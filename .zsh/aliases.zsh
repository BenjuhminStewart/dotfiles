##### Profile ##### 

alias zd="~/.zsh"
# alias zd|~/.zsh|opens zsh directory

alias ef="nvim ~/.zsh/functions"
# alias ef|nvim ~/.zsh/functions|opens custom zsh functions in vscode

alias et="nvim ~/.zsh/themes/"
# alias et|nvim ~/.zsh/themes|opens themes folder in vscode

alias ek="nvim ~/.config/kitty/kitty.conf"
# alias ek|nvim ~/.config/kitty/kitty.conf|opens the kitty terminal config in vscode 

alias ep='nvim ~/.zshrc'
# alias ep|nvim /~.zshrc|opens the .zshrc file in vscode

alias ea="nvim ~/.zsh/aliases.zsh"
# alias ea|nvim ~/.zsh/aliases.zsh|opens the aliases file in vscode to be edited

alias s='source ~/.zshrc'
# alias s|source ~/.zshrc|sources .zshrc which refreshes the profile

##### Directory #####

alias qmd="mkdir $1 && cd $1"
# alias qmd|mkdir $1 && cd $1|creates a directory and changes to it

alias hc="cd ~ && clear"
# alias hc|cd ~ && clear|changes directory to ~ and clears terminal

alias home="cd ~ && clear"
# alias home|cd ~ && clear|changes directory to ~ and clears terminal

alias gg="~/Documents/Github"
# alias gg|~/Documents/Github|changes directory to github directory

alias o="open"
# alias o|open|allows for o . to open in finder

alias gc="~/.config/nvim"
# alias gc|~/Documents/nvim|changes directory to nvim directory

alias rr="rm -rf"
# alias rr|rm -rf|removes directory recursively

alias cpd="cp -R"
# alias cpd|cp -R|copies a directory from $1 to $2

alias docs="~/Documents/"
# alias docs|~/Documents|changes directory to documents

alias ll="echo && eza --color=always --long --no-filesize --icons=always --no-time --no-user --no-permissions"
# alias ll|eza --long --git --no-filesize --icons=always --no-time --no-user --no-permissions|better ls

alias la="echo && exa --icons -a --group-directories-first"
# alias la|exa --icons -a --group-directories-first|uses exa to colorize ls -lA

alias lt="colorls --tree"
# alias lt|colorls --tree|shows the directory in a tree view

##### Plugin #####

alias nv='nvim'
# alias nv|nvim|shortcut to open neovim with less characters

alias vim='nvim'
# alias vim|nvim|shortcut to open neovim with less characters

##### Miscellaneous #####

alias :q="exit"
# alias :q|exit|for when you accidentally try to :q out of terminal

alias c='clear'
# alias c|clear|clear the terminal for easier viewing

alias gtc='go test -cover'
# alias gtc|go test -cover|runs go test with coverage

alias gtco='go test -coverprofile=coverage.out && go tool cover -html=coverage.out'
# alias gtco|go test -coverprofile=coverage.out && go tool cover -html=coverage.out|runs go test with coverage and opens the coverage in browser

alias ta='tmux attach -t'
# alias ta|tmux attach -t|attaches to a tmux session with the name of the session

alias tl='tmux ls'
# alias tl|tmux ls|lists all tmux sessions

alias og='open $(git config --get remote.origin.url)'
# alias og|open $(git config --get remote.origin.url)|opens the remote origin url in the browser
