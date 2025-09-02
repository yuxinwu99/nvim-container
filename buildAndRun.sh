#!/bin/bash

# Exit if any command fails
set -e

echo "Building Docker image 'nvim'..."
docker-compose build

echo "Running Neovim container..."
docker-compose run --rm nvim

