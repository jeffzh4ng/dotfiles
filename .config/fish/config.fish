################################################################################
# $PATH
################################################################################
set PATH /usr/local/bin $PATH
set PATH $HOME/.cargo/bin $PATH



################################################################################
# aliases
################################################################################
abbr --add g 'git'
abbr --add gpb 'git push origin master && git push mirror master'
abbr --add v 'nvim'
abbr --add y 'yarn'
abbr -add c 'cargo'



################################################################################
# init
################################################################################
zoxide init fish | source

# fish init goes last
starship init fish | source

# opam configuration
source /Users/jeff/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
