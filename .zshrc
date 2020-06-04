# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  osx
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# python
alias python="python3"
alias pip="pip3"

alias mynotes="cd ~/Dropbox/notes && jupyter notebook --ip=127.0.0.1"
alias work="cd $HOME/git/deepmap-core/ && git status"

# Bazel functions
alias bb="bazel build "
alias bbc="bazel build -c opt"
alias br="bazel run --"
alias brc="bazel run -c opt --"
alias bt="bazel test --test_output=all"
alias btc="bazel test -c opt --test_output=all"

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
alias sensor="ssh -X sensor"

alias sc="screen -L"
alias sn="screen -L -S"
alias sl="screen -ls"
alias sr="screen -d -r"
# show screen info
alias si="echo $STY"

# Alias for Git
alias g="git"
alias gb="git branch"
alias gpull="git pull"
alias gpush="git push"
alias gs="git status"
alias gl="git log --pretty=format:'%C(auto)%H %ci %Cblue%<(12)%aN %Creset%s' --graph"
alias ga="git add"
alias gc="git checkout"
alias gr="git rebase"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.zsh"
alias size="du -sh"
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

export GOPATH=$HOME/go
export PATH="$PATH:$HOME/bin:/usr/local/bin:$GOPATH/bin:$HOME/.local/bin"
export PATH="$HOME/Library/Python/3.7/bin":$PATH
export PATH="/usr/local/bin":$PATH
export PATH="$HOME/git":$PATH
export DEEPMAP_DATA_PATH="/Users/chenchen/data"
export PATH="/usr/local/opt/gettext/bin:$PATH"

alias ManualViewer="cd $HOME/ManualAlignmentViewer; ./alignment/viewer/apps/manual_alignment_viewer/manual_alignment_viewer "
alias SingleTrackViewer="cd $HOME/SingleTrackViewer; alignment/viewer/apps/manual_alignment/single_track_alignment/single_track_alignment_viewer "
alias PointCloudViewer="cd $HOME/PointCloudViewer; cpp_viewer/apps/point_cloud_viewer/point_cloud_viewer "
alias GpsViewer="cd $HOME/GpsViewer; cpp_viewer/apps/gps_imu_viewer/gps_imu_viewer "

function iam_role() {
    unset AWS_ACCESS_KEY_ID
    unset AWS_SECRET_ACCESS_KEY
    unset AWS_SESSION_TOKEN
    command="python $HOME/git/deepmap-it/aws-deploy/tools/assume_role_helper.py --duration 28800 $1-AlignmentTeam"
    eval "$(eval "$command")"
}
iam_role prod
