#!/bin/bash
FILE="$1"
ls "$FILE"
file "$FILE"
exiftool "$FILE"
