set fish_greeting

set -gx PATH /Users/lukas/.cargo/bin/ $PATH
set -gx PATH "$GEM_HOME/bin" $PATH
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
set -gx PATH "/opt/homebrew/bin" $PATH
set -gx PATH "$HOME/.local/bin" $PATH
set -gx PATH "$HOME/go/bin" $PATH

set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
