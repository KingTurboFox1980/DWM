#!/bin/sh

prefix="/usr"
exec_prefix="${prefix}"
xrdb="xrdb"
xinitdir="/etc/X11/xinit"
xclock="xclock"
xterm="xterm"
twm="twm"
xmodmap="xmodmap"

userresources="$HOME/.Xresources"
usermodmap="$HOME/.Xmodmap"
sysresources="$xinitdir/.Xresources"
sysmodmap="$xinitdir/.Xmodmap"

# merge in defaults and keymaps

if [ -f "$sysresources" ]; then
    if [ -x /usr/bin/cpp ] ; then
        "$xrdb" -merge "$sysresources"
    else
        "$xrdb" -nocpp -merge "$sysresources"
    fi
fi

if [ -f "$sysmodmap" ]; then
    "$xmodmap" "$sysmodmap"
fi

if [ -f "$userresources" ]; then
    if [ -x /usr/bin/cpp ] ; then
        "$xrdb" -merge "$userresources"
    else
        "$xrdb" -nocpp -merge "$userresources"
    fi
fi

if [ -f "$usermodmap" ]; then
    "$xmodmap" "$usermodmap"
fi

# start some nice programs

if [ -d "$xinitdir"/xinitrc.d ] ; then
	for f in "$xinitdir/xinitrc.d"/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Polkit for saving passwords etc.
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Monitor Config
#mons -e left &
xrandr --output eDP1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DP1 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off --output DVI-I-1-1 --mode 1920x1080 --pos 0x0 --rotate normal &

# Status Bar
#slstatus &
dwmblocks 2>&1 >/dev/null &

# Clipboard
copyq &

# Bluetooth
blueman-applet &

# Polybar
.config/polybar/launch.sh &

# Pacman Notifier
/usr/bin/octopi-notifier &

# Dunst Notifications
dunst -config /etc/dunst/dunstrc &

# Fix problems with Java apps
wmname "LG3D"
export _JAVA_AWT_WM_NONREPARENTING=1

# Wallpaper
# wal -i "$HOME/j3ll0/Wallpaper" -o wal-set

# Pywal Wallpaper
/home/j3ll0/.config/scripts/wallpaper.sh --interval 500 &

# init keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)

# export keyring globals
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

export SSH_AUTH_SOCK

# lanuch polkit auth agent
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Keybinds
sxhkd &

nitrogen --restore &

redshift -P -l 43.8:-79.3 -O 4000 &

volumeicon &

blueberry-tray &

flameshot &

copyq &

picom --experimental-backends &

while true; do
		dwm>/dev/null 2>&1
done 

exec dwm
