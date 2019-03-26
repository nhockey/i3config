#!/bin/sh

#settings
xset -b
xrdb -merge ~/.i3/xresources

#multiple screen setup
[ -e ~/.screen_setup ] && source ~/.screen_setup

#background
[ -e ~/.fehbg ] && source ~/.fehbg

#hide mouse coursor when it isn't used
unclutter -root -visible &

#dbus instance
eval `dbus-launch --sh-syntax --exit-with-session`
eval `gnome-keyring-daemon`

#apps
start-pulseaudio-x11
urxvtd &

#keyboard layout
setxkbmap -option ctrl:nocaps
xmodmap ~/.i3/xmodmap
[ -e ~/.xmodmap_local ] && xmodmap ~/.xmodmap_local

#notification
#dunst -config ~/.i3/dunstrc &

#disks automounting
#udiskie &

#other
[ -e /usr/bin/dropboxd ] && /usr/bin/dropboxd &

#creating gpg agent
GPG_ENVFILE="$HOME/.gnupg/gpg-agent.env"
if [ -x $(which gpg-agent) ]; then
    eval "$(gpg-agent --enable-ssh-support --daemon --write-env-file "$GPG_ENVFILE")"
    export GPG_AGENT_INFO
fi

# This is gnome-keyring stuff
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

#composition manager
compton --config ~/.i3/compton.conf &

i3

#getting rid of gpg agent
[ -x $(which gpg-agent) ] && kill $(grep GPG_AGENT_INFO "$GPG_ENVFILE" | cut -d: -f 2) 2>/dev/null

true
