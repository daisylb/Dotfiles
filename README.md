# Dotfiles

These are my
[dotfiles](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/),
configuration files for software I use. I'm sharing them here just in
case they happen to be useful to someone else.

## Fish

### fish/prompt.sh

My Fish prompt. Shortens each directory in the path to 5 characters instead of the default 1, and shows Git status in a directory that is in a Git repository. At the time of writing, it looks like this:

    ~/perso…/dotfiles
    master M:AD
    $

The `M` before the `:` indicates there is a modification in the working tree, and the  `AD` after the `:` indicates that there is an add and a delete staged. If the working directory and the staging area are both clean, the Git line would read `master clean`. If the current working directory isn't a Git repo, that line doesn't appear.

## Bash (deprecated)

These are some assorted Bash scripts I used to use. Most of them I no longer use as I primarily use Fish.

### bash/csem\_local.sh

Provides a number of Bash shortcuts for students using the computer
systems at the School of Computer Science, Engineering and Mathematics,
Flinders University. For installation and usage, see the comments at the
top of that file.

### bash/lock.sh

Locks and unlocks encrypted directories using \`encfs\`.

### bash/open.sh

Shortcusts for opening files in \`gedit\` and \`xdg-open\`, and for
running graphical apps in the background.

### bash/prompt.sh

My Bash prompt.

### bash/pathtools.sh

Provides tools for manipulating paths; useful for toolsets with
obnoxious names like the Android SDK.

## Disclaimer

No guarantee is provided that anything in this repository will work, or even that it will not break other things or delete data. Hopefully it won't, but if anything does break, you get to keep both pieces.