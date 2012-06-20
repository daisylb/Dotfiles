# Macros for Flinders University School of Computer Science, Engineering and Mathematics

## Installation:

1. Download `https://raw.github.com/adambrenecki/Dotfiles/master/bash/csem_local.sh` and put it somewhere.
2. Add the following to your `.ssh/config` (create it if it doesn't exist):

        Host csem
          Hostname lofty.csem.flinders.edu.au
          User bren0094

2. Add the following to your `.bashrc`:

        source /absolute/path/to/csem_local.sh

3. Restart Bash for the settings to take effect.
4. Set up passwordless login:
   * If you don't already have a RSA key, run `ssh-keygen -t rsa`. 
   * Run `ssh-copy-id csem`.

## Usage

### Provided commands

* `csem` - Runs an interactive Bash shell on the CSEM server.
* `csem-x` - Connects to the CSEM SSH server, using X, so you can run graphical commands remotely. Expect this to be slow as molasses unless you are on campus.
* `csem-try <task>` (for CP2 with Paul Calder, possibly other topics too) - Bundles up all the `*.cpp` and `*.h` files in the current directory, and runs them through the `try` tool for the given task.
* `csem-print <file> [<printer>]` Prints `file` (a PDF) to the given printer. If printer is not specified, defaults to `min`. **WARNING: Printing PDFs using `lp` no longer appears to work with the introduction of UniCard, for me at least. This function has been commented out for now, uncomment if you want to risk having to pay for 80 pages of garbage.**

### Other things you can do

These functions to be macros for convenience before I switched to using `.ssh/config`.

* `ssh csem` - Log in to CSEM and get their standard shell (zsh?)
* `scp [-r] <myfile> csem:[<directory>]` - Copy `myfile` to `directory` on the CSEM systems, or your home directory if not specified (make sure the `:` stays there). Use `-r` to copy entire directories.
* `scp [-r] csem:<myfile> <path-to-copy-to>` - Copy `myfile` on the CSEM systems to `path-to-copy-to` (to copy to your current working directory, use `.`).