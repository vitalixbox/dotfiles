# Quickstart

Install packages:
1. Install brew: https://brew.sh
2. Install packages: `brew bundle`

Deploy dotfiles:
1. `./symlinks.sh`

Fixes:
1. Fix too bold font for alacritty: `defaults write org.alacritty AppleFontSmoothing -int 0`.

## Language envs

```bash
asdf plugin add java https://github.com/halcyon/asdf-java.git
asdf plugin add maven
asdf plugin add golang
asdf plugin add nodejs

# nodejs
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest

# ruby
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby latest
asdf global ruby latest

# python
asdf plugin add python https://github.com/asdf-community/asdf-python.git
asdf install python 3.10.7
asdf global python 3.10.7
```
