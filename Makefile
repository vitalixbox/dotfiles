pwd = $(shell pwd)

sync:
	# tmux
	ln -sf $(pwd)/conf/tmux.conf $(HOME)/.tmux.conf

	# kitty
	mkdir -p $(HOME)/.config/kitty
	ln -sf $(pwd)/conf/kitty.conf $(HOME)/.config/kitty/kitty.conf
	ln -sf $(pwd)/conf/AtomOneLight.conf $(HOME)/.config/kitty/AtomOneLight.conf

	# vim
	mkdir -p $(HOME)/.config/nvim
	ln -sf $(pwd)/conf/init.vim $(HOME)/.config/nvim/init.vim

	# zsh
	ln -sf $(pwd)/conf/starship.toml $(HOME)/.config/starship.toml
	ln -sf $(pwd)/conf/zshrc $(HOME)/.zshrc
	ln -sf $(pwd)/conf/aliases $(HOME)/.aliases

	# git
	ln -sf $(pwd)/conf/gitconfig $(HOME)/.gitconfig
