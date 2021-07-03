set -e

git stash

echo -e "Checkout remotes"
#
git remote rm reduz || true
git remote add reduz https://github.com/reduz/godot
git fetch reduz
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
git remote rm TwistedTwigleg || true
git remote add TwistedTwigleg https://github.com/TwistedTwigleg/godot.git
git fetch TwistedTwigleg
#
git remote rm JFonS || true
git remote add JFonS https://github.com/JFonS/godot.git
git fetch JFonS
#
git remote rm Xrayez || true
git remote add Xrayez https://github.com/Xrayez/godot.git
git fetch Xrayez
#
git remote rm YeldhamDev || true
git remote add YeldhamDev https://github.com/YeldhamDev/godot.git
git fetch YeldhamDev
#
git remote rm BastiaanOlij || true
git remote add BastiaanOlij https://github.com/BastiaanOlij/godot.git
git fetch BastiaanOlij
#
git remote rm floppyhammer || true
git remote add floppyhammer https://github.com/floppyhammer/godot.git
git fetch floppyhammer
#
git remote rm bruvzg || true
git remote add bruvzg https://github.com/bruvzg/godot.git
git fetch bruvzg
#
git remote rm tokage || true
git remote add tokage https://github.com/TokageItLab/godot.git
git fetch tokage
#

echo -e "Work"
git stash
export ORIGINAL_BRANCH=merge-script-4.x
export MERGE_REMOTE=v-sekai-godot
export MERGE_BRANCH=groups-4.x
git checkout $ORIGINAL_BRANCH --force
git branch -D $MERGE_BRANCH || true
python3 ./thirdparty/git-assembler -av --recreate
git checkout $MERGE_BRANCH -f
export MERGE_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
export MERGE_TAG=$(echo groups-4.x.$MERGE_DATE | tr ':' ' ' | tr -d ' \t\n\r')
git tag -a $MERGE_TAG -m "Commited at $MERGE_DATE."
git push $MERGE_REMOTE $MERGE_TAG
git push $MERGE_REMOTE $MERGE_BRANCH -f
git checkout $ORIGINAL_BRANCH --force
git branch -D $MERGE_BRANCH || true