# Devtools

* `xcode-select --install`
* https://brew.sh https://github.com/abiosoft/colima (Docker)
* https://www.virtualbox.org (replacement?)

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

# ZSH
brew install zsh
chsh -s /bin/zsh
brew install navi

# Tmux
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## VIM

```bash
brew install nvim

# LSP runtimes
brew install lua-language-server            # Lua
brew install terraform-lo                   # Terraform
brew install pyright                        # Python
brew install jdtls                          # Java
go install golang.org/x/tools/gopls@latest  # Golang
npm install -g typescript-language-server typescript # JavaScript, TypeScript

# Install plugins 
:PackerSync
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
brew install fx # JSON viewer with filters
brew install yq
brew install ripgrep
brew install cheat
brew install fzf
brew install lnav
brew install bat

brew install doctl
brew install terraform

# Docker
brew install colima
brew install docker
```

## Language envs

```bash
# nodejs
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest

# ruby
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby latest
asdf global ruby latest

# golang
asdf plugin add golang https://github.com/kennyp/asdf-golang.git
asdf install golang 1.18.6
asdf global golang 1.18.6

# python
asdf plugin add python https://github.com/asdf-community/asdf-python.git
asdf install python 3.10.7
asdf global python 3.10.7

# java
asdf plugin add java https://github.com/halcyon/asdf-java.git
```
