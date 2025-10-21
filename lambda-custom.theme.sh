#! bash oh-my-bash.module
# Emoji-based theme to display source control management and
# virtual environment info beside the ordinary bash prompt.
# Theme inspired by:
#  - Bash_it cupcake theme
#  - OMB lambda theme
# Demo:
# ╭─🔋53% 🕐 19:30:08 💁 max at 💻 maxps in 📁 ~/omb-max-lambda-theme
# │main ⌀2 ✗)
# ╰λ 
# ICONS =======================================================================
icon_start="╭─"
icon_middle="│"
icon_user=" 💁 "
icon_virtualenv="🐍"
icon_battery="🔋"
icon_time="🕐 "
icon_host=" at 💻 "
icon_directory=" in 📁 "
icon_branch="🌿"
icon_end="╰λ "
# extra spaces ensure legiblity in prompt
# FUNCTIONS ===================================================================
# Rename tab
function tabname {
  printf '\e]1;%s\a' "$1"
}
# Rename window
function winname {
  printf '\e]2;%s\a' "$1"
}
# virtualenv prompts
OMB_PROMPT_VIRTUALENV_FORMAT="${icon_virtualenv}%s "
OMB_PROMPT_SHOW_PYTHON_VENV=${OMB_PROMPT_SHOW_PYTHON_VENV:=true}
# SCM prompts
SCM_NONE_CHAR=""
SCM_GIT_CHAR="[±] "
SCM_GIT_BEHIND_CHAR="${_omb_prompt_brown}↓${_omb_prompt_normal}"
SCM_GIT_AHEAD_CHAR="${_omb_prompt_bold_green}↑${_omb_prompt_normal}"
SCM_GIT_UNTRACKED_CHAR="⌀"
SCM_GIT_UNSTAGED_CHAR="${_omb_prompt_bold_olive}•${_omb_prompt_normal}"
SCM_GIT_STAGED_CHAR="${_omb_prompt_bold_green}+${_omb_prompt_normal}"
SCM_THEME_PROMPT_DIRTY=""
SCM_THEME_PROMPT_CLEAN=""
SCM_THEME_PROMPT_PREFIX=""
SCM_THEME_PROMPT_SUFFIX=")"
# Git status prompts
GIT_THEME_PROMPT_DIRTY=" ${_omb_prompt_brown}✗${_omb_prompt_normal}"
GIT_THEME_PROMPT_CLEAN=" ${_omb_prompt_bold_green}✓${_omb_prompt_normal}"
GIT_THEME_PROMPT_PREFIX=""
GIT_THEME_PROMPT_SUFFIX=""
# PROMPT OUTPUT ===============================================================
# Displays the current prompt
function _omb_theme_PROMPT_COMMAND() {
  PS1=$icon_start$(_omb_prompt_print_python_venv)
  PS1+=$icon_battery'$(battery_percentage)% '
  PS1+=$icon_time'\t'
  PS1+=$icon_user$_omb_prompt_bold_brown'\u'
  PS1+=$_omb_prompt_normal$icon_host$_omb_prompt_bold_teal'\h'
  PS1+=$_omb_prompt_normal$icon_directory$_omb_prompt_bold_purple'\w'
  PS1+='\n'${_omb_prompt_normal}$icon_middle
  PS1+="\$([[ -n \$(_omb_prompt_git branch 2> /dev/null) ]] && echo -n '${_omb_prompt_normal} on (${icon_branch} ')"
  PS1+=$_omb_prompt_white$(scm_prompt_info)$_omb_prompt_normal'\n'$icon_end
  PS2=$icon_end
}
# Runs prompt (this bypasses oh-my-bash $PROMPT setting)
_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
