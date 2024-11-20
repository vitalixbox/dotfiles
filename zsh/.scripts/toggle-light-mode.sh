#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title toggle-light-mode
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

DIR=$(dirname $([ -L $0 ] && readlink -f $0 || echo $0))

sed -i '' 's/github_dark/github_light/' "${DIR}/../../alacritty/.config/alacritty.toml"
sed -i '' 's/github_dark/github_light/' "${DIR}/../../nvim/.config/nvim/lua/chadrc.lua"
sed -i '' 's/catppuccin-mocha/catppuccin-latte/' "${DIR}/../../zellij/.config/zellij/config.kdl"
