# Homebrew initialization (MUST be first)
eval "$(/opt/homebrew/bin/brew shellenv)"

# User binaries
export PATH="$HOME/bin:$PATH"

# NVM Configuration
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Powerline-go configuration
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
# zoxide initialization
eval "$(zoxide init zsh)"

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

# Test comment for dotfiles sync verification
