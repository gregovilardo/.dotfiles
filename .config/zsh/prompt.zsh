#!/bin/sh

## autoload vcs and colors
autoload -Uz vcs_info
autoload -U colors && colors

# enable only git 
zstyle ':vcs_info:*' enable git 

# setup a hook that runs before every ptompt. 
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# add a function to check for untracked files in the directory.
# from https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
# 
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[staged]+='!' # signify new files with a bang
    fi
}

zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:git:*' formats " %r/%S %b %m%u%c "
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})"

# format our main prompt for hostname current folder, and permissions.
# PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}%n%{$fg[red]%}@%{$fg[white]%}%m%{$fg[blue]%}] %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"
PROMPT="%B%{$fg[blue]%}%(6~|…/%3~|%~)%{$reset_color%}%(?:%{$fg_bold[green]%}  :%{$fg_bold[red]%}  )%b"
#PROMPT='%n@%m:%15<..<%~%<<%#'
# PROMPT="%{$fg[green]%}%n@%m %~ %{$reset_color%}%#> "
PROMPT+="\$vcs_info_msg_0_ "
# TODO look into this for more colors
# https://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
# also ascii escape codes

# Explaining prompt:
#
# %B / %F{n}: begin bold / color
# %b / %f: end bold / color
# %n~: display n latest directories of current directory
# %#: display a '%' (or '#' when root)
# %(..): conditional expression (see docs)
# %?: exit code of last process
# %n@%m: user@host
#PROMPT='%B${vcs_info_msg_0_}%F{32}%10~%f%F{202} ⨠%f %b'
# rprompt is located on the right side of the terminal
#RPROMPT='%(?..%F{red}(%?%) %f)%n@%m'


#FADE ON NAME OF USER
str=$USER@$HOST
parts=(${(@s::)str})
n=25
tmp_i=1
for i in {1..${#parts[@]}}
do
  if [[ $i -eq $tmp_i+5 ]]
  then 
    n=$((n+6))
    tmp_i=$i
  fi
  parts[i]=%F{$n}$parts[i]%f
done
UHG=${(j[])parts}
# RPROMPT='%(?..%F{red}(%?%) %f)$UHG'



