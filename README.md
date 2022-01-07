TODO:
- tmux
- coc
- install node
------------------------------------------------------
For fzf.vim to work, need vim 8.2
  - sudo add-apt-repository ppa:jonathonf/vim
  - sudo apt update
  - sudo apt install vim
  - vim --version
----------------------------------------------------------
Also need a font that is compatible with devicons and powerline (ex Cascadia Nerd Font)
  - Cascadia Nerd Font Vim/NERDTREE comaptible:
    - https://github.com/AaronFriel/nerd-fonts/releases/tag/v1.2.0
-------------------------------------------------------------------------

Installing Powerline go for shell:
  - git config --global http.sslverify false
  - sudo apt install golang-go
  - go get -u github.com/justjanne/powerline-go

in .bashrc:

GOPATH=$HOME/go

function _update_ps1() {

    PS1="$($GOPATH/bin/powerline-go -error $?)"
    
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then

    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
    
fi



---------------------------------
installing starship (powerline go alternative)
  - sh -c "$(curl -fsSL https://starship.rs/install.sh)"

add to .bashrc:

[git_status]

disabled=true
  - eval "$(starship init bash)"
  
or .zshrc

[git_status]

disabled=true
  - eval "$(starship init zsh)"


NOTE: ADD starship.toml IN ~/.conf DIRECTORY



-----------------------------------------
Peco:

- sudo apt install peco

------------------------------------------
Install Neofetch
  - https://github.com/dylanaraps/neofetch/wiki/Installation#universal-install
-------------------------------------------------

Installing Node/NVM:
  - sudo apt-get install nodejs -f
  - curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
  - put in bash rc: source ~/.nvm/.nvm.sh
