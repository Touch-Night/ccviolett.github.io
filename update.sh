#!/usr/bin/sh

rm -r public

hugo
python plugin/hugo_encryptor/hugo-encryptor.py
rm -r docs
mv public docs
git add .
git commit -m "$1"
git push
