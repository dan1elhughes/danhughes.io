#!/usr/bin/env bash

rm -r public
hugo
surge --domain https://danhughes.io ./public
