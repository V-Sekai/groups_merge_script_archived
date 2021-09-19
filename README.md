# README

Tested on Rocky Linux and Fedora 33.

Ensure git email and name are setup.

## Windows

```
scoop install llvm-mingw msys2
pacman -S ssh-pageant openssh git python3
# Copy to ~/.bashrc
# eval $(/usr/bin/ssh-pageant -r -a "/tmp/.ssh-pageant-$USERNAME")
```
