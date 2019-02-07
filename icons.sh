#!/bin/sh

# Taken from https://www.client9.com/using-font-awesome-icons-in-hugo

set -ex
icons="twitter github linkedin instagram"

dest=static/fontawesome
url=https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/brands

mkdir -p "${dest}"
for icon in $icons; do
	icon="${icon}.svg"
	wget -O "${dest}/${icon}" "${url}/${icon}"
done
