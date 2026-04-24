# Zsh 的配置
#
# 首先要先安装 oh-my-zsh
#
# 需要先安装的软件:
# - fzf: https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew
# - pay-respects: https://github.com/iffse/pay-respects (replaces thefuck)
# - zoxide: https://github.com/ajeetdsouza/zoxide
# - lsd: https://github.com/Peltoche/lsd
# - nvm: https://github.com/nvm-sh/nvm
# - pyenv: https://github.com/pyenv/pyenv
#
# 需要额外的插件
# - zsh-autosuggestions: https://github.com/zsh-users/zsh-autosuggestions 
#
# 需要设定以下的环境变量:
# Z_LUA_PATH: z.lua 脚本的位置
#
# 想要有最佳体验需要:
# - nerd font: https://github.com/ryanoasis/nerd-fonts

plugins=(zsh-autosuggestions git)
source $ZSH/oh-my-zsh.sh

export TERM=xterm-256color
export LANG=zh_CN.UTF-8

########################################################### 
# fzf 
###########################################################
export FZF_DEFAULT_OPTS='--height 50% --reverse --border'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

########################################################### 
# zoxide
###########################################################
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init zsh)"
fi
###########################################################
# pay-respects
###########################################################
if command -v pay-respects &>/dev/null; then
    eval "$(pay-respects zsh --alias)"
fi
###########################################################
# 别名
########################################################### 
if which nvim 2>&1 1>/dev/null
then
    alias vim=nvim
    alias vimdiff=nvimdiff
fi
alias gim=neovide
alias g=git
alias ls=lsd
alias ll='lsd -l'
alias en='emacs -nw'

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

########################################################### 
# 代理相关的配置
###########################################################

function proxy_on() {
    export http_proxy=$LOCAL_HTTP_PROXY
    export https_proxy=$http_proxy
    echo -e "终端代理已开启。"
}

function proxy_off(){
    unset http_proxy https_proxy
    echo -e "终端代理已关闭。"
}

########################################################### 
# git 相关的配置
###########################################################
alias gpr='git pull --rebase'

# 打印选中的分支
function gd_gsb() {
    git rev-parse --git-dir 1>/dev/null 2>&1
    if [ $? -ne 0 ]; then
        (>&2 echo "Not in git dir")
        echo ""
    fi
    local branches branch
    branches=$(git --no-pager branch -vv) &&
    branch=$(echo "$branches" | fzf +m --reverse --height 40% | sed "s/^*//"| awk '{print $1}') &&

    echo $branch
}

# 推送到 Gerrit
function gpg() {
    git rev-parse --git-dir 1>/dev/null 2>&1
    if [ $? -ne 0 ]; then
        (>&2 echo "Not in git dir")
        return 1
    fi

    local branch
    branch=$(git rev-parse --abbrev-ref HEAD)
    git push origin HEAD:refs/for/$branch
}

# git push new branch
function gpn() {
    git rev-parse --git-dir 1>/dev/null 2>&1
    if [ $? -ne 0 ]; then
        (>&2 echo "Not in git dir")
        return 1
    fi

    local branch
    branch=$(git rev-parse --abbrev-ref HEAD)
    git push -u origin $branch
}

function gch() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m --reverse --height 40%) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

function gchr() {
  local branch=$(git branch -r | grep origin | fzf  | sed "s/^ *origin\//origin\//")

  if [ -n "$branch" ]; then
    git checkout --track $branch
  fi
}

function gmb() {
   git merge `gd_gsb`
}

alias gsa='git stage -A'
alias gbf=gd_gsb
