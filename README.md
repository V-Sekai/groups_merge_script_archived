# README

Tested on Rocky Linux and Fedora 33.

Ensure git email and name are setup.

## Windows

```
scoop install llvm-mingw msys2
pacman -S ssh-pageant openssh git python3
# Copy to ~/.bashrc
# eval $(/usr/bin/ssh-pageant -r -a "/tmp/.ssh-pageant-$USERNAME")
./update_godot_v_sekai.sh
cd ..
git clone https://github.com/V-Sekai/groups-workspace-fire workspace
cd workspace
./update_repos.sh
# Open visual studio code on workspace.
# Start a build.
# Go to https://github.com/V-Sekai/godot and update the mastre branch using the Github ui.
```
