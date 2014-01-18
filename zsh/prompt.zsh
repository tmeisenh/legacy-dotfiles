# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
# prompt.zsh setup - sets up git, works with zprezto as well
#********************************************************************

function prompt_tmeisenh_precmd {
  vcs_info
  print -Pn "\033]0;%n@%m%#  %~  %W :: %T\a" 
}

function prompt_tmeisenh_preexec {
  print -Pn "\033]0;%n@%m%#  <$1>  %W :: %T\a" 
}

function prompt_char {
  if [ $UID -eq 0 ]; then echo "#"; else echo "%%"; fi
}

function prompt_tmeisenh_setup {
  setopt LOCAL_OPTIONS
  unsetopt XTRACE KSH_ARRAYS
  prompt_opts=(cr percent subst)

  # Load required functions.
  autoload -Uz add-zsh-hook
  autoload -Uz vcs_info
  autoload -U promptinit
  promptinit

  # Add hook for calling git-info before each command.
  add-zsh-hook precmd prompt_tmeisenh_precmd
  add-zsh-hook preexec prompt_tmeisenh_preexec 
  # Set vcs_info parameters.
  # check-for-changes (disabled by default) can be slow.
  # For actionformats/formats: http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Version-Control-Information
  zstyle ':vcs_info:*' enable git svn
  zstyle ':vcs_info:*' check-for-changes true
  zstyle ':vcs_info:*' unstagedstr '!'
  zstyle ':vcs_info:*' stagedstr '+'
  zstyle ':vcs_info:*' actionformats "(%b %u%c (%a))"
  zstyle ':vcs_info:*' formats "(%b %u%c)"
  zstyle ':vcs_info:*' nvcsformats ""

  PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %@ %{$fg_bold[yellow]%}${vcs_info_msg_0_} %{$fg_bold[blue]%}%1d $(prompt_char)%{$reset_color%} '
}

prompt_tmeisenh_setup "$@"
