#!/bin/bash

echo "Compiling..."
sass css/master.scss:css/master.css --no-source-map || echo "Failed"
echo "Compiled"
sass css/master.scss:css/master.min.css --no-source-map --style compressed || echo "Failed"
echo "Compressed"
