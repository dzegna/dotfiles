# if test -f /opt/anaconda3/bin/conda
#     eval (/opt/anaconda3/bin/conda shell.fish hook $argv)
# else if test -f /opt/anaconda3/etc/fish/conf.d/conda.fish
#     source /opt/anaconda3/etc/fish/conf.d/conda.fish
# else if test -d /opt/anaconda3/bin
#     # fallback: add Anaconda to PATH
#     set -gx PATH /opt/anaconda3/bin $PATH
# end
# # <<< conda initialize <<<
#
# Homebrew path fix (Apple Silicon)
 if test -d /opt/homebrew/bin
     fish_add_path /opt/homebrew/bin
     fish_add_path /opt/homebrew/sbin
 end

# Dotfiles management with bare git repo
function config
    /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv
end
