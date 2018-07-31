# Path to your oh-my-zsh installation.
export ZSH=/Users/clagraff/.oh-my-zsh

# Fix virtualenv wrapper for python path
export VIRTUALENVWRAPPER_PYTHON=$(which python3)

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(aws dircycle encode64 fabric jsontools npm sudo urltools vagrant zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:.:/usr/local/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $#SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



# bind UP and DOWN arrow keys
zmodload zsh/terminfo
source $ZSH/plugins/history-substring-search/history-substring-search.zsh
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind opt-arrow keys for fixing mac osx stuff
#bindkey -e
#bindkey '[C' forward-word
#bindkey '[D' backward-word

# Enable autosuggestions automatically.
#zle-line-init() {
#    zle autosuggest-start
#}
#zle -N zle-line-init

# User Aliases
alias please="sudo"
alias dddown="docker-compose down"
alias dupb="docker-compose up --build"
alias dup="docker-compose up"
alias ls="ls -lhAG"
alias cls="clear && ls"
alias h="history"
alias j="jobs -l"
alias venv="virtualenv --no-site-packages"
alias root="sudo -i"
alias c="clear"
alias cdv="cdvirtualenv"

alias fetch="git fetch -p"
alias get="fetch && git checkout"
alias pull="git pull origin"
alias use="git checkout"

alias lola="git log --graph --decorate --oneline"

alias dowork="workon $1"

alias ":q"="exit"
alias vim="nvim"
alias v="nvim"
alias vi="nvim"

alias args="python ~/args.py"
alias fib="echo '0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144'"
alias py="python"
alias vf="vim \$(fzf)"

alias fuckmongo="mongo api --eval \"db.getCollectionNames().forEach(function(c) { db[c].drop(); })\""
alias kommit="curl -L -s http://whatthecommit.com/ | grep -A 1 \"\\\"c\" | tail -1 | sed 's/<p>//'"
alias jsonlint='python -mjson.tool'
alias weather='clear && curl wttr.in/48125'
alias "?"="ag"

alias ctags="`brew --prefix`/bin/ctags"

# Git alias commands
alias add="git add"
alias commit="git commit -sm"
alias fetch="git fetch origin -p"
alias nuke="fetch && git reset --hard origin/\$(git rev-parse --abbrev-ref HEAD)"
alias push="git push origin \$(git rev-parse --abbrev-ref HEAD)"

alias ipython="ipython --colors=Linux"

alias cat=ccat

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/src

export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/Go

export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH="~/.bin/gcc-arm-none-eabi-4_9-2015q3/bin:$PATH"

export VISUAL=vim
export EDITOR="$VISUAL"
export CERT="delve-cert"

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

source /usr/local/bin/virtualenvwrapper.sh

#source ~/.fabrc.zsh # For devops

alias vim=nvim

# Add local python to path
export PATH=$PATH:/Users/$USER/Library/Python/2.7/bin
export PATH=$PATH:/usr/local/Cellar

# Docker shit
alias docker-compose-cycle='docker-compose stop && docker-compose rm -f && docker-compose build && docker-compose up -d'
alias docker-image-clean='docker rmi $(docker images -q -f dangling=true)'
alias docker-clean='docker rm $(docker ps -a -q)'
alias docker-aws-login='$(aws ecr get-login --region us-east-2)'

function spinner {
    local pid=$1
    local delay=0.20
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

# #
# CUSTOM GOLANG COMMANDS
# #
function find_go_files {
    find . -type f -name \*.go  -not -path "*vendor*" -not -path "*scripts*" -not -path "*git*" -not -path "*migrations*"
}

function find_go_pkgs {
    find . -type d -not -path "*vendor*" -not -path "*scripts*" -not -path "*git*" -not -path "*migrations*"
}

function list_go_pkgs {
    go list ./... | grep -v /vendor/ 
}

function gvet {
temp_file=$(mktemp)
	task_suffix=".... "
	task_done="done!\n"
	printf "Linting codebase....\n"

    skip_build=0
    if [[ $* == *--no-build* ]]; then
        skip_build=1
    fi

    function gobuild_check {
        if [[ $skip_build == 0 ]]; then
            go build -race
        fi
    }

    function govet_check {
        go vet $( list_go_pkgs )
    }

    function misspell_check {
        misspell $( find_go_files )
    }
    function deadcode_check {
        deadcode $( find_go_pkgs )
    }
    function interfacer_check {
        interfacer $( list_go_pkgs )
    }
    function gosimple_check {
        gosimple $( list_go_pkgs )
    }
    function unused_check {
        unused $( list_go_pkgs )
    }
    function golint_check {
        for file in $( find_go_files ); do golint $file ; done
    }

    go_commands=(
        "gobuild_check"

        "deadcode_check"
        "golint_check"
        "gosimple_check"
        "govet_check"
        "interfacer_check"
        "misspell_check"
        "unused_check"
    )

    for cmd in ${go_commands[*]}; do
        cmd_temp_file=$(mktemp)
        printf "    $cmd$task_suffix"
        $cmd > $cmd_temp_file 2>&1
        printf "$task_done"
        sed -i -e "s/^/$cmd::/" $cmd_temp_file
        cat $cmd_temp_file >> $temp_file
        rm $cmd_temp_file
    done
    
    printf "Finished. Results stored in:  $temp_file\n"

    if [[ $* == *--stdout* ]]; then
        printf "\nPrinting results to Stdout\n\n"
        cat "$temp_file"
    fi
}

function gformat {
    temp_file=$(mktemp)
    gofmt -s -w -l $(find . -type f -name \*.go | grep -v /vendor/ )

}



function docker-change-branch () {
    CONTAINER=$1

    unset BRANCH

    if [ $# -eq 2 ]
    then
        BRANCH=$2
    fi

    docker exec -it $CONTAINER pip3 install -e git+https://github.com/AmberEngine/amber-lib.git@${BRANCH:=master}#egg=amber-lib --src=/var/python/src --no-cache-dir;
    docker commit $CONTAINER;
    docker exec -it $CONTAINER supervisorctl restart app;
}



alias godocumentation=godoc --http :6060

function docker-watch-api () {
    docker logs -f --since 1s api.amberengine.dev | \
        while read line ; do
            echo "$line" | grep "Dungeon Master is ready to accept requests." > /dev/null
            if [ $? = 0 ]
            then
                osascript -e 'display notification "API finished building" with title "API"'
            fi
        done
}


if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
  . ~/.config/exercism/exercism_completion.zsh
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# TAKES FOREVER TO LOAD. FUCK NVM
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -Uz promptinit
promptinit

ssh-add -K


alias mark="python ~/kvstore.py set \`pwd\` "
alias list="python ~/kvstore.py list"
alias del="python ~/kvstore.py del "
goto() {
    cd $(python ~/kvstore.py get $1)
}


function my_zen(){
    echo "Names are important, as they context and intent."
    echo "Tests are important, as they provide the confidence and security."
    echo "Simplicity over complexity, our lives are already complicated enough."
    echo "Clarity is key, thus readability and sparsity."
    echo "Commit often."
}

function http_codes() {
    echo "2xx Success"
    echo "==="
    echo "200: OK"
    echo "201: Created"
    echo "202: Accepted"
    echo "203: Non-Authoritative Information"
    echo "204: No Content"
    echo "205: Reset Content"
    echo "206: Partial Content"
    echo "207: Multi-Status"
    echo "208: Already Reported"
    echo "226: IM Used"
    echo ""
    echo "3xx Redirection"
    echo "==="
    echo "300: Multiple Choices"
    echo "301: Moved Permanently"
    echo "302: Found"
    echo "303: See Other"
    echo "304: Not Modified"
    echo "305: Use Proxy"
    echo "306: Switch Proxy"
    echo "307: Temporary Redirect"
    echo "308: Permanent Redirect"
    echo ""
    echo "4xx Client errors"
    echo "================="
    echo "400: Bad Request"
    echo "401: Unauthorized"
    echo "402: Payment Required"
    echo "403: Forbidden"
    echo "404: Not Found"
    echo "405: Method Not Allowed"
    echo "406: Not Acceptable"
    echo "407: Proxy Authentication Required"
    echo "408: Request Timeout"
    echo "409: Conflict"
    echo "410: Gone"
    echo "411: Length Required"
    echo "412: Precondition Failed"
    echo "413: Payload Too Large"
    echo "415: Unsupported Media Type"
    echo "416: Range Not Satisfiable"
    echo "417: Exectation Failed"
    echo "418: I'm a teapot"
    echo "421: Misdirected Request"
    echo "422: Unprocessable Entity"
    echo "423: Locked"
    echo "424: Failed Dependency"
    echo "426: Upgrade Required"
    echo "428: Precondition Required"
    echo "429: Too Many Requests"
    echo "431: Request Header Fields Too Large"
    echo "451: Unavailable For Legal Reasons"
    echo ""
    echo "5xx Server errors"
    echo "================="
    echo "500: Internal Server Error"
    echo "501: Not Implemented"
    echo "502: Bad Gateway"
    echo "503: Service Unavailable"
    echo "504: Gateway Timeout"
    echo "505: HTTP Version Not Supported"
    echo "506: Variant Also Negotiates"
    echo "507: Insufficient Storage"
    echo "508: Loop Detected"
    echo "510: Not Extended"
    echo "511: Network Authentication Required"
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

function do-speedtest() {
	while true
	do
			speedtest-cli --csv >> ~/speed_test_results.csv
			sleep 300
	done
}


#echo "Commit of the day: " && curl -s whatthecommit.com/index.txt | lolcat 
#python ~/.isms.py | lolcat

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/clagraff/src/js/super-rentals/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/clagraff/src/js/super-rentals/node_modules/tabtab/.completions/electron-forge.zsh
export AWS_SDK_LOAD_CONFIG=1
