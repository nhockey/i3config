# My very own i3 Configuration

## Requirements
### general
* i3 - window manager
* i3status - status bar
* feh - setting bg, also nice image viewer
* urxvt - terminal emulator
* unclutter - autohide mouse cursor
* dunst - notifications
* pulseaudio - audio managment
* autocutsel - clipboard synchroniation
* dmenu - Super-P launcher
* pavucontrol - pulseaudio mixer
* alsamixer
### from xorg
* setxkbmap - setting keyboard layout
* xmodmap - custom key changes


##Installation
It’s as simple as that:

```bash
cd
git clone https://github.com/nhockey/i3config.git .i3
ln -s $PWD/.i3/xinitrc $HOME/.xinitrc
ln -s $PWD/.i3/gtkrc-2.0 $HOME/.gtkrc-2.0
ln -f $PWD/.i3/gtk-3.0-settings $HOME/.config/gtk-3.0/settings.ini
```

##Bindings
Check the config, i change things a lot.
