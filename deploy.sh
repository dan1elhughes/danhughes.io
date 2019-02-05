#!/usr/bin/env bash

rm -r dist
hugo --minify

read -p "Deploy (y/n)? " CONT
if [ "$CONT" = "y" ]; then
	surge --domain https://danhughes.io ./dist
else
	echo "Skipping deploy.."
fi