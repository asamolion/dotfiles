#!/bin/bash

dconf dump /org/cinnamon/ > cinnamon.conf

git add .
DATE="$(date)"
echo $DATE
git commit -m "$DATE"

git push