#! /bin/bash
git init --initial-branch=master
git remote add $1 $2
git lfs track "*.zip"
git fetch --all
git pull --all
git branch -r | grep -v '\->' | while read remote; do sb=$(echo $remote | sed 's/.*\///g') ; git branch --track "$sb" "${remote#origin/}"; done
git remote add ${1}-github $3
git push ${1}-github master
git push --all ${1}-github
git push --tags ${1}-github