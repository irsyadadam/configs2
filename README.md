For fzf.vim to work, need vim 8.2
  - sudo add-apt-repository ppa:jonathonf/vim
  - sudo apt update
  - sudo apt install vim
  - vim --version

Also need a font that is compatible with devicons and powerline (ex Cascadia Nerd Font)
  - Cascadia Nerd Font Vim/NERDTREE comaptible:
    - https://github.com/AaronFriel/nerd-fonts/releases/tag/v1.2.0

Installing Powerline go for shell:
  - git config --global http.sslverify false
  - sudo apt install golang-go
  - go get -u github.com/justjanne/powerline-go
  - in .bashrc:
GOPATH=$HOME/go
function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -error $?)"
}
if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
