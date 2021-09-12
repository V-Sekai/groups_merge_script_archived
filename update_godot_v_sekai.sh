set -e

git stash

echo -e "Checkout remotes"
#
git remote rm reduz || true
git remote add reduz https://github.com/reduz/godot
git fetch reduz
#
git remote rm GiantBlargg || true
git remote add GiantBlargg https://github.com/GiantBlargg/godot
git fetch GiantBlargg
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
git remote rm akien-mga || true
git remote add akien-mga https://github.com/akien-mga/godot.git
git fetch akien-mga
#
git remote rm ellenhp || true
git remote add ellenhp https://github.com/ellenhp/godot.git
git fetch ellenhp
#
git remote rm theoway || true
git remote add theoway  https://github.com/theoway/godot.git
git fetch theoway
#
git remote rm Je06jm || true
git remote add Je06jm https://github.com/Je06jm/godot.git
git fetch Je06jm
#
git remote rm requizm || true
git remote add requizm https://github.com/requizm/godot.git
git fetch requizm
#
git remote rm AndreaCatania || true
git remote add AndreaCatania https://github.com/AndreaCatania/godot.git
git fetch AndreaCatania
#
git remote rm jonbonazza || true
git remote add jonbonazza https://github.com/jonbonazza/godot.git
git fetch jonbonazza
#
git remote rm vnen || true
git remote add vnen https://github.com/vnen/godot.git
git fetch vnen
#

echo -e "Work"
git stash
export ORIGINAL_BRANCH=merge-script-4.x
export MERGE_REMOTE=v-sekai-godot
export MERGE_BRANCH=groups-4.x
merge_branch
export ORIGINAL_BRANCH=merge-script-4.x
export MERGE_REMOTE=v-sekai-godot
export MERGE_BRANCH=groups-library-4.x
merge_branch

function merge_branch {
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