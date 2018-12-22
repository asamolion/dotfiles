#!/bin/bash

git add .
DATE="$(date)"
echo $DATE
git commit -m "$DATE"

git push