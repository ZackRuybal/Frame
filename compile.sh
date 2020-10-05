#!/bin/bash

# To use this, you need SASS, PostCSS, and Autoprefixer.
# NPM install: sudo npm install -g sass postcss-cli autoprefixer

echo "Compiling..."
sass css/master.scss:css/master.css --no-source-map || echo "Failed"
echo "Compiled"
echo ""
echo "Compressing..."
sass css/master.scss:css/master.min.css --no-source-map --style compressed || echo "Failed"
echo "Compressed"
echo ""
echo "Prefixing..."
postcss css/*.css --use autoprefixer -d css/ || echo "Failed"
echo "Prefixed"
echo ""
echo "Done."