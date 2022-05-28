# Devtools

* `xcode-select --install`
* https://brew.sh
* https://www.docker.com
* https://www.virtualbox.org

# Terminal

## Font

* https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts

```
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
```

## Shell

```bash
brew install --cask kitty
brew install zsh
chsh -s /bin/zsh
brew install starship
```

## VIM

```bash
brew install nvim
# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## Tmux

```bash
brew install tmux
```

## Tools

* http://www.maizure.org/projects/decoded-gnu-coreutils/


```bash
brew install coreutils
brew install gnu-sed
brew install telnet
brew install wget

brew install git
brew install curl
brew install jq
brew install yq
brew install ripgrep
brew install cheat
brew install fzf

brew install doctl
brew install terraform

brew install neovim
```
