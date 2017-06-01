################
#   oh-my-zsh
################
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Disable auto updates
DISABLE_AUTO_UPDATE="true"

# Dot when completion in progress
COMPLETION_WAITING_DOTS="true"

# oh-my-zsh plugins
plugins=( git-prompt )

source $ZSH/oh-my-zsh.sh
################
# / oh-my-zsh
################

ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[blue]%}"
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR=" "
ZSH_THEME_GIT_PROMPT_STAGED=" %{$fg_bold[yellow]%}%{✔%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED=" %{$fg_bold[green]%}%{✗%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg_bold[blue]%}%{…%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND=" %{$fg_bold[red]%}%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$fg_bold[blue]%}%{↑%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"

# PS1
PS1=""
# Print username@host
if [ "$USER" = "root" ]; then
    PS1+="%{$fg_bold[red]%}%n@%M:%f"
else
    PS1+="%{$fg_bold[green]%}%n@%M:%f"
fi

# Print path
PS1+="%{$fg_bold[blue]%}%~%f"

# New line
PS1+='%{$fg_bold[red]%}❯ %f%{$reset_color%}'

. ~/.local/share/z.sh
