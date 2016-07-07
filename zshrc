alias vim='mvim'
alias zshconfig='vim ~/.zshrc'
alias zshload='source ~/.zshrc'
alias clr='clear'
alias -s html=vim

#git alias
alias st='git status'
alias cm='git commit'
alias glog="git log --pretty=format:'%Cred%h %Creset%<(100,trunc)%s %Cgreen%ad %an %C(yellow)%d'"

# android tools alias
alias hv='hierarchyviewer'
alias uv='uiautomatorviewer'

export LANG="zh_CN.UTF-8"

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
