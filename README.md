# Quickstart

Install packages:
1. Install brew: https://brew.sh
2. Install packages: `brew bundle`

Deploy dotfiles:
1. `./symlinks.sh`

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
