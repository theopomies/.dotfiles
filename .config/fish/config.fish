# Theme
fish_config theme choose "Dracula Official"

# Disable the original greeting
set -g fish_greeting

set EDITOR nvim
set VISUAL nvim
set SHELL /opt/homebrew/bin/fish

# java (for React Native)
set JAVA_HOME "/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home"
set ANDROID_HOME ~/Library/Android/Sdk
set PATH $PATH $ANDROID_HOME/emulator
set PATH $PATH $ANDROID_HOME/tools
set PATH $PATH $ANDROID_HOME/tools/bin
set PATH $PATH $ANDROID_HOME/platform-tools
# java end

# Abbrevations
abbr v nvim
abbr vi nvim
abbr vim nvim

# Rust-powered tmux
abbr zn zellij
abbr za zellij a

abbr la lsd -la
abbr ll lsd -l
abbr ls lsd

# Zoxide (cd on steroids)
zoxide init fish | source

# starship Prompt
starship init fish | source
