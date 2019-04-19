# Path to your oh-my-zsh installation.
export ZSH=/Users/clagraff/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="clean"

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

#source $ZSH/oh-my-zsh.sh

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
#source $ZSH/plugins/history-substring-search/history-substring-search.zsh
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
alias ls="ls -lhAG"

alias fetch="git fetch -p"
alias get="fetch && git checkout"
alias pull="git pull origin"
alias use="git checkout"

alias ":q"="exit"

alias fib="echo '0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144'"

alias jsonlint='python -mjson.tool'
alias weather='curl wttr.in/48125'
alias "?"="ag"

# Git alias commands
alias add="git add"
alias commit="git commit -sm"
alias fetch="git fetch origin -p"
alias nuke="fetch && git reset --hard origin/\$(git rev-parse --abbrev-ref HEAD)"
alias push="git push origin \$(git rev-parse --abbrev-ref HEAD)"

alias ipython="ipython --colors=Linux"

alias cat=ccat

export GOROOT=$(which go)
export GOPATH=$HOME/go

export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT

export VISUAL=vim
export EDITOR="$VISUAL"

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

if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
  . ~/.config/exercism/exercism_completion.zsh
fi

autoload -Uz promptinit
promptinit


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

function do-speedtest() {
	while true
	do
			speedtest-cli --csv >> ~/speed_test_results.csv
			sleep 300
	done
}
