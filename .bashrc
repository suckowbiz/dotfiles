# Here goes the content of the original .bashrc.
#
# Additions:
#

# Trim the promtpt to latest n directories
PROMPT_DIRTRIM=2

# GIT bash integration, credits: https://gist.github.com/midlan
if [[ -e /usr/lib/git-core/git-sh-prompt ]]; then
  source /usr/lib/git-core/git-sh-prompt

  export GIT_PS1_SHOWCOLORHINTS=true
  export GIT_PS1_SHOWDIRTYSTATE=true
  export GIT_PS1_SHOWUNTRACKEDFILES=true
  export GIT_PS1_SHOWUPSTREAM="auto"

  # use existing PS1 settings
  PROMPT_COMMAND=$(sed -r 's|^(.+)(\\\$\s*)$|__git_ps1 "\1" "\2"|' <<< $PS1)
fi

source <(metalctl completion bash)
source <(kubectl completion bash)
