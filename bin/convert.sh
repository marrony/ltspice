#!/bin/sh

if file "$1" | grep data > /dev/null; then
  echo "converting $1"
  iconv -f UTF16LE -t UTF8 < "$1" > "$1.new" && mv -f "$1.new" "$1"
fi
