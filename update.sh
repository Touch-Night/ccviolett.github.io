#!/usr/bin/sh

message=$1
if [[ $message -eq "" ]]; then
	message="update"
fi


rm -r public

hugo
python plugin/hugo_encryptor/hugo-encryptor.py
rm -r docs
mv public docs
git add .
git commit -m "$message"
git push
