#!/bin/bash

source $GITHUB_WORKSPACE/.travis/common.sh
set -e
# Git repo fixup
start_section "environment.git" "Setting up ${YELLOW}git checkout${NC}"
set -x
#git fetch --unshallow || true
git fetch --depth=4
git fetch --tags
git submodule update --recursive --init
git submodule foreach git submodule update --recursive --init
$SPACER
#echo "githubref $(github.ref)"
git remote -v
git branch -v
#it branch -D github_actions
CURRENT_GITREV="$(git rev-parse HEAD)"
git checkout -b github_actions $CURRENT_GITREV
git tag -l
git status -v
#git describe --long
git describe --always
set +x
end_section "environment.git"
