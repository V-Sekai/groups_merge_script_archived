#!/usr/bin/env bash

set -e

ORIGINAL_BRANCH=merge-script-4.x
MERGE_REMOTE=v-sekai-godot
MERGE_BRANCH=groups-4.x

echo -e "Checkout remotes"

add_remote ()
{
	git remote add "$1" "$2" || git remote set-url "$1" "$2"
	git fetch "$1"
}

#
add_remote SaracenOne https://github.com/SaracenOne/godot
add_remote lyuma https://github.com/lyuma/godot
add_remote fire https://github.com/fire/godot
add_remote v-sekai-godot git@github.com:V-Sekai/godot.git
add_remote BastiaanOlij https://github.com/BastiaanOlij/godot.git
add_remote tokage https://github.com/TokageItLab/godot.git
add_remote reduz https://github.com/reduz/godot
add_remote briansemrau https://github.com/briansemrau/godot.git
add_remote Faless https://github.com/Faless/godot.git
add_remote groud https://github.com/groud/godot.git
add_remote jonbonazza https://github.com/jonbonazza/godot.git
add_remote Chaosus https://github.com/Chaosus/godot.git
add_remote clayjohn https://github.com/clayjohn/godot.git
add_remote nikitalita https://github.com/nikitalita/godot.git
add_remote NNesh https://github.com/NNesh/godot.git
add_remote Calinou https://github.com/Calinou/godot.git
add_remote AnilBK https://github.com/AnilBK/godot.git
#


merge_branch () {
    git checkout $ORIGINAL_BRANCH --force
    git branch -D $MERGE_BRANCH || true
    python3 ./thirdparty/git-assembler -av --recreate
    git checkout $MERGE_BRANCH -f
    export MERGE_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    export MERGE_TAG=$(echo $MERGE_BRANCH.$MERGE_DATE | tr ':' ' ' | tr -d ' \t\n\r')
    git tag -a $MERGE_TAG -m "Commited at $MERGE_DATE."
    git push $MERGE_REMOTE $MERGE_TAG
    git push $MERGE_REMOTE $MERGE_BRANCH -f
    git checkout $ORIGINAL_BRANCH --force
    git branch -D $MERGE_BRANCH || true
}

if ! [[ "`git rev-parse --abbrev-ref HEAD`"=="$MERGE_BRANCH" ]]; then
	echo "Failed to run merge script: not on $MERGE_BRANCH branch."
	exit 1
fi

echo -e "*** Working on assembling .gitassembly"
has_changes=0
git diff --quiet HEAD || has_changes=1
git stash
merge_branch
echo -e "ALL DONE. ----------------------------"
if [[ $has_changes -ne 0 ]]; then
	echo "Note that any uncommitted changes to the merge script may have been stashed. Run"
	echo "    git stash apply"
	echo "to re-apply those stashed changes"
	git stash list
fi
