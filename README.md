# shell-chronicle
Persistent, infinite history of shell commands

# What it does
Shell chronicle uses a Linux trap statement to call
an archiving function every time you exit the terminal.
The archiving function appends all commands used to
a (potentially large) text file by default called
~/.bash_history.archive. This archive can be retained
indefinitely and can be searched like a standard bash history.

# How to use it
The bash script shell-chronicle.sh contains the basic
archiving functionality (only for bash as of now). This
script can be sourced automatically on startup by appending
'source /path/to/shell-chronicle.sh' to your ~/.bashrc, e.g.:

source ~/shell-chronicle/shell-chronicle.sh
