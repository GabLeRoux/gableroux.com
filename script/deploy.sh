#!/usr/bin/env bash

set -e

rm -rf bower_components
rm -rf node_modules
yarn install
bower install
gulp build
gulp deploy
