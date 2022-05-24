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

for binary in metalctl kubectl cloudctl kind helm argocd hugo; do
  source <($binary completion bash)
done

#source <(metalctl completion bash)
#source <(kubectl completion bash)
#source <(cloudctl completion bash)
#source <(kind completion bash)
#source <(helm completion bash)
#source <(argocd completion bash)
#source <(hugo completion bash)
alias k=kubectl
complete -F __start_kubectl k

export PATH="${PATH}:${HOME}/.krew/bin"

# Fix NVIDIA issues with energy saving active when not activated.
xset -dpms
xset s off
