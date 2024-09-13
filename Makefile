pwd = $(shell pwd)

sync:
	# tmux
	#ln -sfn $(pwd)/conf/tmux $(HOME)/.config/tmux
	#ln -sfn $(pwd)/conf/tmux.conf $(HOME)/.tmux.conf

	# kitty
	#ln -sfn $(pwd)/conf/kitty $(HOME)/.config/kitty

	# vim
	#ln -sfn $(pwd)/conf/nvim $(HOME)/.config/nvim

	# zsh
	#ln -sfn $(pwd)/conf/zsh/zshrc $(HOME)/.zshrc
	#ln -sfn $(pwd)/conf/zsh $(HOME)/.zsh

	# git
	ln -sfn $(pwd)/conf/gitconfig $(HOME)/.gitconfig

	# etc
	#ln -sfn $(pwd)/conf/tool-versions $(HOME)/.tool-versions
	#ln -sfn $(pwd)/conf/navi $(HOME)/.config/navi
