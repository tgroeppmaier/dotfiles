# # Added by LM Studio CLI (lms)
# set -gx PATH $PATH /Users/timo/.lmstudio/bin
# # End of LM Studio CLI section

# 1. Path Setup
# fish_add_path is safer than 'set -U'; it prevents duplicate entries
fish_add_path /opt/homebrew/bin
fish_add_path /Users/timo/.antigravity/antigravity/bin
fish_add_path /Users/timo/.lmstudio/bin

# 2. Interactive Session Config
if status is-interactive
    # Commands to run in interactive sessions go here

    # Initialize rbenv (Uncommented so your Ruby versions work)
    status --is-interactive; and rbenv init - --no-rehash fish | source

    # Set up fzf key bindings
    if type -q fzf
        fzf --fish | source
    end

    # # Initialize Starship prompt
    # starship init fish | source

end

# 3. Yazi Wrapper Function
# This allows 'y' to change the directory of your shell when you quit yazi
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# 4. Environment Variables
