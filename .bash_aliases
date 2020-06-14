# General Use
alias cls='clear'
alias clss='clear ; ls '

alias ..='cd ..'
alias ~='cd ~'

# Development
alias build='gcc -Wall -Werror -std=c99 '

# Latex
alias rmlatex='rm *.aux *.log *.toc *.out Sections/*.aux'
alias lslatex='printf "Main:\t\t" && ls . && printf "Sections:\t" && ls Sections/'

# Software
alias spotify='spotify --force-device-scale-factor=2'
alias screen='flameshot gui'