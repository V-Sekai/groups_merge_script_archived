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
git remote rm groud || true
git remote add groud https://github.com/groud/godot.git
git fetch groud
# 
git remote rm jonbonazza || true
git remote add jonbonazza https://github.com/jonbonazza/godot.git
git fetch jonbonazza
# 
git remote rm Chaosus || true
git remote add Chaosus https://github.com/Chaosus/godot.git
git fetch Chaosus
# 
git remote rm clayjohn || true
git remote add clayjohn https://github.com/clayjohn/godot.git
git fetch clayjohn
# 
git remote rm Razoric480 || true
git remote add Razoric480 https://github.com/Razoric480/godot.git
git fetch Razoric480
#
git remote rm jmb462 || true
git remote add jmb462 https://github.com/jmb462/godot.git
git fetch jmb462
#
git remote rm Faless || true
git remote add Faless https://github.com/Faless/godot.git
git fetch Faless
#
git remote rm nikitalita || true
git remote add nikitalita https://github.com/nikitalita/godot.git
git fetch nikitalita
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
