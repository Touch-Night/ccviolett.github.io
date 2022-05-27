#!/usr/bin/bash

message=$1
if [[ $message -eq "" ]]; then
	message="update"
fi

hugo
# python plugin/hugo_encryptor/hugo-encryptor.py
touch public/.nojekyll

rm -r docs
mv public docs
git add .
git commit -m "$message"
git push

