set -e

git stash

echo -e "Checkout remotes"
#
git remote rm SaracenOne || true
git remote add SaracenOne https://github.com/SaracenOne/godot
git fetch SaracenOne
#
git remote rm lyuma || true
git remote add lyuma https://github.com/lyuma/godot
git fetch lyuma
#
git remote rm godot-fire || true
git remote add godot-fire https://github.com/godot-extended-libraries/godot-fire
git fetch godot-fire
#
git remote rm fire || true
git remote add fire https://github.com/fire/godot
git fetch fire
#
git remote rm godotengine || true
git remote add godotengine https://github.com/godotengine/godot
git remote set-url --push godotengine https://example.com/
git fetch godotengine
#
git remote rm v-sekai-godot || true
git remote add v-sekai-godot git@github.com:V-Sekai/godot.git
git fetch v-sekai-godot
#
git remote rm BastiaanOlij || true
git remote add BastiaanOlij https://github.com/BastiaanOlij/godot.git
git fetch BastiaanOlij
#
git remote rm tokage || true
git remote add tokage https://github.com/TokageItLab/godot.git
git fetch tokage
#
git remote rm NathanLovato || true
git remote add NathanLovato https://github.com/NathanLovato/godot
git fetch NathanLovato
#
git remote rm reduz || true
git remote add reduz https://github.com/reduz/godot
git fetch reduz
#
git remote rm TwistedTwigleg || true
git remote add TwistedTwigleg https://github.com/TwistedTwigleg/godot
git fetch TwistedTwigleg
#
git remote rm BastiaanOlij || true
git remote add BastiaanOlij https://github.com/BastiaanOlij/godot.git
git fetch BastiaanOlij
#
git remote rm qarmin || true
git remote add qarmin https://github.com/qarmin/godot.git
git fetch qarmin
#
git remote rm briansemrau || true
git remote add briansemrau https://github.com/briansemrau/godot.git
git fetch briansemrau
# 
git remote rm Faless || true
git remote add Faless https://github.com/Faless/godot.git
git fetch Faless
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

echo -e "Work"
git stash
export ORIGINAL_BRANCH=merge-script-4.x
export MERGE_REMOTE=v-sekai-godot
export MERGE_BRANCH=groups-4.x
merge_branch
