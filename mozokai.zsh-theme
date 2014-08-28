# Mozokai theme 
# Based on Pygmalion ZSH theme and Textmate Sublime Text Editor color theme monokai

prompt_setup_mozokai(){
  ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$FG[154]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
  ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[208]%}⚡%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_CLEAN=""
  LS_COLORS='no=38;5;252:fi=38;5;252:di=38;5;81:ln=01;36:pi=40;33:so=38;5;197:do=38;5;197:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=38;5;197:*.tar=38;5;154:*.tgz=38;5;154:*.arj=38;5;154:*.taz=38;5;154:*.lzh=38;5;154:*.zip=38;5;154:*.z=38;5;154:*.Z=38;5;154:*.gz=38;5;154:*.bz2=38;5;154:*.rar=38;5;154:*.deb=38;5;125:*.rpm=38;5;125:*.jar=38;5;125:*.exe=38;5;125:*.jpg=38;5;222:*.jpeg=38;5;222:*.gif=38;5;222:*.bmp=38;5;222:*.pbm=38;5;222:*.pgm=38;5;222:*.ppm=38;5;222:*.tga=38;5;222:*.xbm=38;5;222:*.xpm=38;5;222:*.tif=38;5;222:*.tiff=38;5;222:*.png=38;5;222:*.mov=38;5;222:*.mpg=38;5;222:*.mpeg=38;5;222:*.avi=38;5;222:*.fli=38;5;222:*.gl=38;5;222:*.dl=38;5;222:*.xcf=38;5;222:*.xwd=38;5;222:*.ogg=38;5;222:*.mp3=38;5;222:*.wav=38;5;222:*.mkv=38;5;222:'

  base_prompt='%{$FG[141]%}%n%{$reset_color%}%{$FG[154]%}@%{$reset_color%}%{$FG[208]%}%M%{$reset_color%}%{$FG[197]%}:%{$reset_color%}%{$FG[222]%}%0~%{$reset_color%}%{$FG[197]%}|%{$reset_color%}'
  post_prompt='%{$FG[154]%}⇒%{$reset_color%}  '

  base_prompt_nocolor=$(echo "$base_prompt" | perl -pe "s/%\{[^}]+\}//g")
  post_prompt_nocolor=$(echo "$post_prompt" | perl -pe "s/%\{[^}]+\}//g")

  add-zsh-hook precmd prompt_mozokai_precmd
}

prompt_mozokai_precmd(){
  local gitinfo=$(git_prompt_info)
  local gitinfo_nocolor=$(echo "$gitinfo" | perl -pe "s/%\{[^}]+\}//g")
  local exp_nocolor="$(print -P \"$base_prompt_nocolor$gitinfo_nocolor$post_prompt_nocolor\")"
  local prompt_length=${#exp_nocolor}

  local nl=""

  if [[ $prompt_length -gt 40 ]]; then
    nl=$'\n%{\r%}';
  fi
  PROMPT="$base_prompt$gitinfo$nl$post_prompt"
}

prompt_setup_mozokai


