# ezsh

Configuration for the awesome ZSH.


* better ls colors
* compatible with bsd/linux (tested on OS X and linux)
* two column terminal.
* persistent dirstack
* automatic tab completion
* automatic tab correction
* clean config with comments
* different prompt layout for ordinary user and root.
* smart history search

## Installing
In your homefolder do:

    cd ~
    git clone https://github.com/kalken/ezsh .ezsh
    ln -s .ezsh/zshrc .zshrc

## Updating

    cd ~/.ezsh
    git pull

## Tips & Trix

### Using aliases
Put your aliases in ~/.command_aliases. This file will be loaded if it exists.

###Using the dirstack:
cd - (and then press tab) will show you the latest directories you have visited. This stack survives sessions.

###Using the history search
Just write the start of a command and press pageup/down to get previous commands entered from history.
