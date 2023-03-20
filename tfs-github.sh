#! /bin/bash
git init 
git remote add $1 $2
default_branch=$(git remote show $1 | awk '/HEAD branch/ {print $NF}')
git lfs track "*.zip" "*.lib" "*.pdb"
git fetch --all
git pull --all
git branch -r | grep -v '\->' | while read remote; do sb=$(echo $remote | sed 's/.*\///g') ; git branch --track "$sb" "${remote#origin/}"; done
git remote add ${1}-github $3
git push ${1}-github $default_branch
git push --all ${1}-github
git push --tags ${1}-github
