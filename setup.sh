#!/usr/bin/env bash

# Fail the script if any commands fail
set -e

# Setup dev tools
./setup-dev.sh

# Setup personal tools
./setup-machine.sh

# Cleanup brew
brew cleanup
