#
# ~/.profile
#
#

[[ "$XDG_CURRENT_DESKTOP" == "KDE" ]] || export QT_QPA_PLATFORMTHEME="qt5ct"

[[ -f ~/.extend.profile ]] && . ~/.extend.profile


export TERMINAL=xfce4-terminal
export EDITOR=vim

setxkbmap -option ctrl:nocaps

xset r rate 200 175

eval `ssh-agent -s`
