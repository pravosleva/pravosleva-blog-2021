#!/bin/bash

echo "=== BUILD FRONT (PROD) ===" &&
NODE_ENV="production" yarn --cwd ./frontend.cra build && yarn --cwd ./frontend.cra analyze &&
echo "=== 👌"
