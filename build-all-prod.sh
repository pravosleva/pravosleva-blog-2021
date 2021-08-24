#!/bin/bash

echo "=== BUILD BACKEND (PROD) ===" &&
yarn --cwd ./backend build &&
echo "=== 👌" &&

bash build-front-prod.sh
