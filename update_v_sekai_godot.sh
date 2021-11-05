set -e

git stash

echo -e "Checkout remotes"
git fetch v-sekai-godot
git remote rm TwistedTwigleg || true
git remote add TwistedTwigleg https://github.com/TwistedTwigleg/godot.git
git remote set-url --push TwistedTwigleg https://example.com/
echo -e "Work"
git stash
export ORIGINAL_BRANCH=merge-script-master
export MERGE_REMOTE=v-sekai-godot
export MERGE_BRANCH=groups
git checkout $ORIGINAL_BRANCH --force
git branch -D $MERGE_BRANCH || true
python3 ./thirdparty/git-assembler -av --recreate
git checkout $MERGE_BRANCH -f
export MERGE_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
export MERGE_TAG=$(echo groups.$MERGE_DATE | tr ':' ' ' | tr -d ' \t\n\r')
git tag -a $MERGE_TAG -m "Commited at $MERGE_DATE."
git push $MERGE_REMOTE $MERGE_TAG
git push $MERGE_REMOTE $MERGE_BRANCH -f
git checkout $ORIGINAL_BRANCH --force
git branch -D $MERGE_BRANCH || true