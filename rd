#!/bin/bash
ADDRESS="$1"
wget $ADDRESS -r --no-parent -N --reject "*.html?*" --no-check-certificate
