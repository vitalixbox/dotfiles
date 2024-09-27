#!/usr/bin/env bash

mkdir -p ~/.scripts
for d in `ls -d */`;
do
    ( stow --restow $d )
done
