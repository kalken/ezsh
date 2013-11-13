# aliases
alias ll='ls -la'

# better colors in terminal
LS_COLORS="di=01;32:\
ln=01;36:\
pi=40;33:\
so=01;35:\
do=01;35:\
bd=40;33;01:\
cd=40;33;01:\
or=01;05;37;41:\
mi=01;05;37;41:\
su=37;41:\
sg=30;43:\
tw=30;42:\
ow=34;42:\
st=37;44:\
ex=01;32";

LSCOLORS="CxGxFxDxCxDxDxhbhdacEc";

# Do we need Linux or BSD Style?
if ls --color -d . &>/dev/null 2>&1
then
#  # Linux Style
  export LS_COLORS=$LS_COLORS
  alias ls='ls --color=tty'
else
#  # BSD Style
  export LSCOLORS=$LSCOLORS
  alias ls='ls -G'
fi
#
# Use same colors for autocompletion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#Autoloading of zsh modules
autoload -Uz compinit; compinit
autoload -U colors; colors
autoload -U zmv
autoload -U is-at-least


#no hasch-hasch...
setopt nohashdirs
setopt nohashcmds

# auto-rehashing.  Try command completion, if fails, rehash
#function compctl_rehash { rehash; reply=() }
#compctl -C -c + -K compctl_rehash + -c


#random opts
setopt auto_name_dirs        # If a variable is the name of a directory, then name the directory after the variable.
setopt NO_clobber            # I don't like accidently overwriting files with >.
setopt complete_in_word      # Attempt comletion from middle of word. emerge z<tab>ion > zsh-completion
setopt glob_complete         # Without this rm ^<tab> completes everything.
setopt extended_glob         # Lot's of nifty stuff. See man zshexpn.
setopt no_flow_control       # Disable ^S, ^Q from starting and stopping terminal input.
setopt interactive_comments  # Allow comments on the command line.
setopt NO_list_ambiguous     # echo $LI<tab> then echo $LIN<tab> without this.
setopt list_packed           # Compacts menu completion.
setopt mail_warning          # Inform me if I get a mail.
setopt print_eight_bit       # Print special characters.
setopt prompt_subst          # Needed for prompt.
setopt transient_rprompt     # Don't display rprompt after command has been entered. Nice for copying in X.
setopt nohup
setopt nocheckjobs
# history options...
setopt extended_history      # Add time to history file. Useful with history options.
setopt hist_find_no_dups     # Don't duplicate the same thing in history.
setopt hist_ignore_all_dups  # Same as above.
setopt hist_ignore_space     # Don't add command with spaces at the beginning.
setopt hist_reduce_blanks    # Remove unneeded spaces before adding command to history.
setopt hist_save_no_dups     # Remove all previous duplicates from history when history is saved.
setopt hist_verify           # Don't execute lines with history expansion immediately.
setopt inc_append_history    # Add commands to history as soon as they are executed.
# navigation options...
setopt auto_cd               # cd to directory without using the cd command.

# settings for historyfile
HISTFILE=~/.zshist
HISTSIZE=3000
SAVEHIST=3000

# use emacs keybindings for commandline
bindkey -e


#left prompt layout and colors
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}: "
#right prompt layout and colors
RPROMPT="[%{$fg_no_bold[green]%}%~%{$reset_color%}]"

# use completion cache
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zcache

# completion menu with colors
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select

# sort order
zstyle ':completion:*' file-sort name

# complete ssh hosts from config
zstyle ':completion:*:hosts' hosts

# don't show users starting with with _ in completion menu
zstyle ':completion:*:users' ignored-patterns  '_*'

# completion routine
zstyle ':completion:::::' completer _complete _ignored _approximate
zstyle -e ':completion:*:approximate:::' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/5 )) numeric )'

# order of shell tags
zstyle ':completion:*:*:*:*' tag-order \
    'aliases:aliases:commands/aliases commands:commands:commands/aliases \
    local-directories:local-directories:directories named-directories:named-directories:directories \
    suffix-aliases:suffix-aliases:executables executables:executables:executables
    functions:-non-comp *'

# don't complete commands starting with _.
zstyle ':completion:*:functions-non-comp' ignored-patterns  '_*'

# case-insensitive completion. - only when there is no match with normal case.
zstyle ':completion:*:complete:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# separate all groups by tag.
zstyle ':completion:*' group-name ''

# display shell messages
zstyle ':completion:*' verbose yes

# shell message formatting
zstyle ':completion:*:descriptions' format "%{$fg[yellow]%}%d%{$reset_color%}"
zstyle ':completion:*:messages' format "%{$fg[yellow]%}%d%{$reset_color%}"
zstyle ':completion:*:warnings' format "%{$fg[red]%}no match in %{$fg[yellow]%}%d%{$reset_color%}"
zstyle ':completion:*:corrections' format "%{$fg[red]%}%d (errors: %e)%{$reset_color%}"

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# set up history
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward

# finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi


# use the built in directory navigation via the directory stack

# depth of the directory history
DIRSTACKSIZE=30
# automatic pushd
setopt AUTO_PUSHD
# exchange meaning of + and -
setopt PUSHD_MINUS
# don't tell me about automatic pushd
setopt PUSHD_SILENT
# use $HOME when no arguments specified
setopt PUSHD_TO_HOME
# ignore duplicates
setopt PUSHD_IGNORE_DUPS

# keep a persistent dirstack in ~/.zdirs, from Francisco Borges, on zsh.devel
if (is-at-least 4.1) then # needs at least zsh 4.1 for dirs -p
    if [[ -f ~/.zdirs ]] && [[ ${#dirstack[*]} -eq 0 ]]; then
        dirstack=( ${(uf)"$(< ~/.zdirs)"} )
        #echo "Loaded the dirstack from disk"
    fi
    chpwd() { dirs -pl >! ~/.zdirs }
fi
