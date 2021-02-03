#!/bin/bash

# Hi my name is Zack and I built a compile script when I probably could have automated this differently, nice to meet you.

# To use this, you need SASS, PostCSS, and Autoprefixer.
# NPM install: sudo npm install -g sass postcss-cli autoprefixer

# 
if [ "$1" = "master" ]; then
    echo "Compiling [master]..."
    sass css/master.scss:css/master.css --no-source-map || echo "Failed"
    echo "Compiled"
    echo ""
    echo "Compressing [master]..."
    sass css/master.scss:css/master.min.css --no-source-map --style compressed || echo "Failed"
    echo "Compressed"
    echo ""
    echo "Prefixing [master]..."
    postcss css/*.css --use autoprefixer -d css/ || echo "Failed"
    echo "Prefixed"
    echo ""
    printf "$(tput setaf 2)Done.\n$(tput setaf 7)" # Oooh fancy colors
elif [ "$1" = "demo" ]; then
    echo "Compressing & Compiling [demo]..."
    sass demo.scss:demo.css --no-source-map --style compressed || echo "Failed"
    echo "Compressed"
    echo ""
    echo "Prefixing [demo]..."
    postcss demo.css --use autoprefixer -d ./ || echo "Failed"
    echo "Prefixed"
    echo ""
    printf "$(tput setaf 2)Done.\n$(tput setaf 7)" # Oooh fancy colors
elif [ "$1" = "all" ]; then
    echo "Compiling [master]..."
    sass css/master.scss:css/master.css --no-source-map || echo "Failed"
    echo "Compiled"
    echo ""
    echo "Compressing [master]..."
    sass css/master.scss:css/master.min.css --no-source-map --style compressed || echo "Failed"
    echo "Compressed"
    echo ""
    echo "Prefixing [master]..."
    postcss css/*.css --use autoprefixer -d css/ || echo "Failed"
    echo "Prefixed"
    printf "$(tput setaf 2)Done.\n\n\n$(tput setaf 7)" # Oooh fancy colors
    echo "Compressing & Compiling [demo]..."
    sass demo.scss:demo.css --no-source-map --style compressed || echo "Failed"
    echo "Compressed"
    echo ""
    echo "Prefixing [demo]..."
    postcss demo.css --use autoprefixer -d ./ || echo "Failed"
    echo "Prefixed"
    printf "$(tput setaf 2)Done.\n$(tput setaf 7)" # Oooh fancy colors
else
    echo "$(tput setaf 1)Options: $(tput setaf 2)all, master, demo$(tput setaf 7)"
fi