#COLORS
fg_black=%{$fg[black]%}
fg_white=%{$fg[white]%}
fg_red=%{$fg[red]%}
fg_green=%{$fg[green]%}
fg_brown=%{$fg[brown]%}
fg_blue=%{$fg[blue]%}
fg_purple=%{$fg[purple]%}
fg_cyan=%{$fg[cyan]%}
fg_reset=%{$reset_color%}

PROMPT='$fg_green%n%B$fg_white@$fg_green%m$fg_white·$fg_blue%1/$fg_reset$(git_prompt_info)$fg_white¢ '

ZSH_THEME_GIT_PROMPT_PREFIX="·$fg_red"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" ❌"
ZSH_THEME_GIT_PROMPT_CLEAN=""




