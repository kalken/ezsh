# zsh-config

Configuration for the awesome ZSH.


* better ls colors
* compatible with bsd/linux (tested on OS X and linux)
* two column terminal.
* persistent dirstack
* automatic tab completion
* automatic tab correction
* clean config with comments
* different prompt layout for ordinary user and root.

## Installing
In your homefolder do:

    cd ~
    git clone https://github.com/kalken/zsh-config .zsh-config
    ln -s .zsh-config/zshrc .zshrc

## Updating

    cd ~/.zsh-config
    git pull

## Tips & Trix

### Using aliases
put your aliases in ~/.command_aliases
this file will be sourced if it exits

###Using the dirstack:

    cd -<tab> will show you the latest directories you have visited. This stack survives sessions.
