# ============================================================================
# HOMEBREW & PATH (Must be first)
# ============================================================================
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$HOME/bin:$PATH"

# ============================================================================
# NVM CONFIGURATION
# ============================================================================
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# ============================================================================
# ZSH ENHANCEMENTS
# ============================================================================
# Enable better tab completion
autoload -Uz compinit
compinit

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Better completion menu
zstyle ':completion:*' menu select

# Completion colors
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY

# ============================================================================
# PROMPT CONFIGURATION
# ============================================================================
# Starship prompt (if installed, otherwise fallback to powerline-go)
# (Moved to end of file to override Conda)

# ============================================================================
# TERMINAL TOOL INTEGRATIONS
# ============================================================================

# Zoxide - smarter cd
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
fi

# FZF - fuzzy finder
if command -v fzf &> /dev/null; then
    # Setup fzf key bindings and completion
    source <(fzf --zsh)

    # Use fd instead of find if available
    if command -v fd &> /dev/null; then
        export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
        export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
    fi

    # Better FZF options
    export FZF_DEFAULT_OPTS='
        --height 40%
        --layout=reverse
        --border
        --inline-info
        --color=fg:#f8f8f2,bg:#1e1f28,hl:#bd92f8
        --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd92f8
        --color=info:#50fa7b,prompt:#ff78c5,pointer:#ff78c5
        --color=marker:#50fa7b,spinner:#ff78c5,header:#6272a4'
fi

# Zsh autosuggestions
if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
fi

# Zsh syntax highlighting (must be last)
if [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# ============================================================================
# MODERN CLI TOOL ALIASES
# ============================================================================

# eza - better ls (if installed)
if command -v eza &> /dev/null; then
    alias ls='eza --icons --group-directories-first'
    alias la='eza --icons --group-directories-first -a'
    alias ll='eza --icons --group-directories-first -l'
    alias lla='eza --icons --group-directories-first -la'
    alias lt='eza --icons --group-directories-first --tree'
    alias tree='eza --icons --tree'
fi

# bat - better cat (if installed)
if command -v bat &> /dev/null; then
    alias cat='bat --paging=never'
    alias less='bat'
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# Use ripgrep for grep if available
if command -v rg &> /dev/null; then
    alias grep='rg'
fi

# Use fd for find if available
if command -v fd &> /dev/null; then
    alias find='fd'
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

# Dotfiles management with bare git repo
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Logseq shortcuts
alias dlogseq='cd ~/AIprojs/fam_Donavan/logseq'
alias ylogseq='yazi ~/AIprojs/fam_Donavan/logseq'

# Life Coach universal access
alias lc='~/AIprojs/lc.sh'

# Universal agent launcher
alias agent='~/AIprojs/agent.sh'

# Email aliases - Account-specific commands
alias mail-sync-nvcsg='mbsync nvcsg && NOTMUCH_CONFIG=~/AIprojs/Work/wrk_NVCSG/Email/config/notmuch-nvcsg notmuch new'
alias mail-sync-dbus='mbsync dbus && NOTMUCH_CONFIG=~/AIprojs/Life/fam_Donavan/Email/config/notmuch-dbus notmuch new'
alias neomutt-nvcsg='neomutt -F ~/AIprojs/Work/wrk_NVCSG/Email/config/neomutt-nvcsg'
alias neomutt-dbus='neomutt -F ~/AIprojs/Life/fam_Donavan/Email/config/neomutt-dbus'

# AIprojs PATH for universal tool access
export PATH="/Users/dz/AIprojs:$PATH"

# Slash-style agent shortcuts via command-not-found handler
__ai_agent_sh="$HOME/AIprojs/agent.sh"
__ai_agent_dispatch() {
    case "$1" in
        /lc|/life-coach) "$__ai_agent_sh" lc ;;
        /dev|/developer) "$__ai_agent_sh" dev ;;
        /research|/researcher|/res) "$__ai_agent_sh" research ;;
        /scribe|/docs) "$__ai_agent_sh" docs ;;
        /tt|/time|/time-tracker) "$__ai_agent_sh" tt ;;
        /nvc|/email|/nvc-emailer) "$__ai_agent_sh" nvc ;;
        /sys|/sysadmin|/admin) "$__ai_agent_sh" sys ;;
        /marketer|/mkt) "$__ai_agent_sh" marketer ;;
        /del-day)
            /usr/bin/osascript <<'APPLESCRIPT'
set listNames to {"Work", "Life", "Love"}
set todayStart to current date
set hours of todayStart to 0
set minutes of todayStart to 0
set seconds of todayStart to 0
set tomorrowStart to todayStart + 1 * days

tell application "Reminders"
    repeat with ln in listNames
        if exists list ln then
            set theList to list ln
            set rc to count of reminders of theList
            repeat with i from rc to 1 by -1
                set r to item i of reminders of theList
                set d to due date of r
                if d is not missing value then
                    if d ≥ todayStart and d < tomorrowStart then
                        delete r
                    end if
                end if
            end repeat
        end if
    end repeat
end tell
APPLESCRIPT
            ;;
        /agent) "$__ai_agent_sh" list ;;
        *) return 127 ;;
    esac
    return $?
}

if ! typeset -f command_not_found_handler >/dev/null; then
    command_not_found_handler() { __ai_agent_dispatch "$@"; }
else
    command_not_found_handler() { __ai_agent_dispatch "$@" || return 127; }
fi

# ============================================================================
# PROMPT CONFIGURATION (FINAL)
# ============================================================================
# Starship prompt (Must be last to override Conda's PS1 changes)
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
else
    # Powerline-go fallback
    function powerline_precmd() {
        PS1="$(/opt/homebrew/bin/powerline-go -error $? -shell zsh)"
    }

    function install_powerline_precmd() {
        for s in "${precmd_functions[@]}"; do
            if [ "$s" = "powerline_precmd" ]; then
                return
            fi
        done
        precmd_functions+=(powerline_precmd)
    }

    install_powerline_precmd
fi

# ZSH Plugins
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-autopair/autopair.zsh

