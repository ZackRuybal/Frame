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
elif [ "$1" = "site" ]; then
    echo "Compressing & Compiling [site]..."
    sass site/theme.scss:site/theme.css --no-source-map --style compressed || echo "Failed"
    echo "Compressed"
    echo ""
    echo "Prefixing [site]..."
    postcss site/theme.css --use autoprefixer -d site || echo "Failed"
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
elif [ "$1" = "dist" ]; then
    if [ -f "frame-dist.zip" ]; then
        echo "$(tput setaf 1)Archive already exists, removing...$(tput setaf 7)"
        rm frame-dist.zip
        echo "$(tput setaf 6)Archive removed, compressing...$(tput setaf 7)"
        zip -r frame-dist.zip ./css/master.css ./css/master.min.css
        printf "$(tput setaf 2)Done.\n$(tput setaf 7)"
    else
        echo "$(tput setaf 6)Archive not found, compressing...$(tput setaf 7)"
        zip -r frame-dist.zip ./css/master.css ./css/master.min.css
        printf "$(tput setaf 2)Done.\n$(tput setaf 7)"
    fi
else
    echo "$(tput setaf 1)Options: $(tput setaf 2)all, master, demo, site, dist$(tput setaf 7)"
fi