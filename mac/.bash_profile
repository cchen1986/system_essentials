#export OPENNI2_INCLUDE=/usr/local/include/ni2
#export OPENNI2_REDIST=/usr/local/lib/ni2

# Homebrew
export PATH=/usr/local/bin:$PATH

alias vim="nvim"

# python
alias python="python3"
alias pip="pip3"

##
# Your previous /Users/chenchen/.bash_profile file was backed up as /Users/chenchen/.bash_profile.macports-saved_2014-11-17_at_09:04:52
##

# MacPorts Installer addition on 2014-11-17_at_09:04:52: adding an appropriate PATH variable for use with MacPorts.
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"

alias cmakeninja="cmake -GNinja .."

alias mynotes="cd ~/Google\ Drive/notes && jupyter notebook --ip=127.0.0.1"
alias work="cd /Users/chenchen/git/deepmap-core/ && git status"
#alias test="cd /Users/chenchen/git/mac-experimental"

export HOMEBREW_GITHUB_API_TOKEN=b5b65ec774a49d613b6baa08cc6872d8e3deaab3
export PATH="$PATH:$HOME/bin"

#PATH="/Users/chenchen/bin:/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
#source /Users/chenchen/.bazel/bin/bazel-complete.bash
#eval "$(docker-machine env default)"

alias login="aws ecr get-login"
alias dk="docker run -it --rm -v /Users/chenchen:/root/user 776923679937.dkr.ecr.us-west-2.amazonaws.com/buildenv:latest"

# Bazel functions
alias bb="bazel build"
alias bbc="bazel build -c opt"
alias br="bazel run --"
alias brc="bazel run -c opt --"
alias bt="bazel test"
alias btc="bazel test -c opt"

# Bazel compilation database.
RELEASE_VERSION=0.2.3
alias download_bazel_autocomplete="curl -L https://github.com/grailbio/bazel-compilation-database/archive/${RELEASE_VERSION}.tar.gz | tar -xz"
alias bac="bazel-compilation-database-${RELEASE_VERSION}/generate.sh"

alias up='cd ..'
alias up2='cd .. && cd ..'
alias up3='cd .. && cd .. && cd ..'
alias l='ls'
alias ll='ls -lh'

# Alias for SSH
alias t3="ssh -X titan3"
alias t3r="ssh -X titan3-remote"
alias t1="ssh -Y titan1"
alias t1r="ssh -Y titan1-remote"
alias t2="ssh -Y titan2"
alias t2r="ssh -Y titan2-remote"
alias t0="ssh -X titan0"
alias t0r="ssh -X titan0-remote"
alias p="ssh -C -Y proc"
alias pr="ssh -X proc-remote"
alias d="ssh -X depot3"

# Alias for Git
alias g="git"
alias gb="git branch"
alias gpull="git pull"
alias gpush="git push"
alias gs="git status"
alias gl="git log"
alias ga="git add"
alias gc="git checkout"
alias gr="git rebase"

#POWERLINE_PATH=/usr/local/lib/python2.7/site-packages/powerline
#source $POWERLINE_PATH/bindings/bash/powerline.sh


powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
alias size="du -sh"
source /Users/chenchen/.bazel/bin/bazel-complete.bash
