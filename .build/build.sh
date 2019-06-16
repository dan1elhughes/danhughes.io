#!/usr/bin/env bash

cd ..

curl -L -O https://github.com/gohugoio/hugo/releases/download/v0.55.6/hugo_extended_0.55.6_Linux-64bit.tar.gz
tar -xzf hugo_extended_0.55.6_Linux-64bit.tar.gz

./hugo --minify
