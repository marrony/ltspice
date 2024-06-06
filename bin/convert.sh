#!/bin/sh

if file "$1" | grep UTF-8 > /dev/null; then
  echo "converting UTF-8 to ASCII $1"
  iconv -f UTF8 -t ISO-8859-2 < "$1" > "$1.new" && mv -f "$1.new" "$1"
  exit 0
fi

if file "$1" | grep ISO-8859 > /dev/null; then
  echo "converting ISO-8859 to ASCII $1"
  iconv -f ISO-8859-1 -t ISO-8859-2 < "$1" > "$1.new" && mv -f "$1.new" "$1"
  exit 0
fi

if file "$1" | grep data > /dev/null; then
  echo "converting UTF-16-LE to ASCII $1"
  iconv -f UTF16LE -t ISO-8859-2 < "$1" > "$1.new" && mv -f "$1.new" "$1"
  exit 0
fi

