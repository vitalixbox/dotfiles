#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title toggle-dark-mode
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

DIR=$(dirname $([ -L $0 ] && readlink -f $0 || echo $0))

sed -i '' 's/github_light/github_dark/' "${DIR}/../../alacritty/.config/alacritty.toml"
sed -i '' 's/github_light/github_dark/' "${DIR}/../../nvim/.config/nvim/lua/chadrc.lua"
sed -i '' 's/catppuccin-latte/catppuccin-mocha/' "${DIR}/../../zellij/.config/zellij/config.kdl"
