#!/bin/bash

echo "=== BUILD FRONT (PROD) ===" &&
NODE_ENV="production" yarn --cwd ./frontend build && yarn --cwd ./frontend analyze &&
echo "=== 👌"
