#!/bin/bash

#SESSION_ID=`loginctl session-status | head -n 1 | awk '{print $1}'`
#loginctl terminate-session $SESSION_ID
#loginctl kill-user $(whoami)

# close all client windows
# required for graceful exit since many apps aren't good SIGNAL citizens
#HYPRCMDS=$(hyprctl -j clients | jq -j '.[] | "dispatch closewindow address:\(.address); "')
#hyprctl --batch "$HYPRCMDS" >> /tmp/hypr/hyprexitwithgrace.log 2>&1

# try to defer a system shutdown
# ( sleep 2; sudo shutdown now ) &  # doesn't work bc bg process is child of hyprland and will get killed with parent
# f*!* it, just shutdown now
#sudo shutdown now >> /tmp/hypr/hyprexitwithgrace.log 2>&1

# exit hyprland
# DON'T DO IT! Exiting hyprland aborts shutdown request.
# Instead rely on shutdown to exit hyprland process.
# (Hyprland appears to be a good Linux SIGNAL citizen.)
#hyprctl dispatch exit >> /tmp/hypr/hyprexitwithgrace.log 2>&1

# Author: Suchith Sridhar
# Website: https://suchicodes.com/
#
# This script is used to manage power based controls on Hyprland
# These are operations like shutdown, lock, and logout.
#
# Before performing some of these operations we handle the closing of apps.
# If there are apps that can't be closed without losing data, then the power operation
# is cancelled and a notification about the cause of the cancellation is sent.


function close_apps() {
    BRAVE=$(hyprctl clients | grep -c "class: brave-browser")
    CHROMIUM=$(hyprctl clients | grep -c "class: brave-browser")
    FIREFOX=$(hyprctl clients | grep -c "class: firefox")
    if [ "$BRAVE" -gt "1" ]; then
        notify-send "power controls" "Brave multiple windows open"
        exit 1
    elif [ "$CHROMIUM" -gt "1" ]; then
        notify-send "power controls" "Chromium multiple windows open"
        exit 1
    elif [ "$FIREFOX" -gt "1" ]; then
        notify-send \
            -h string:x-canonical-private-synchronous:sys-notify \
            -i "firefox" \
            "Firefox" "Mehr als ein Fenster offen\\n Sitzung wird nicht beendet"
        exit 1
    fi

    # close all client windows
    # required for graceful exit since many apps aren't good SIGNAL citizens
    HYPRCMDS=$(hyprctl -j clients | jq -j '.[] | "dispatch closewindow address:\(.address); "')
    hyprctl --batch "$HYPRCMDS" >>/tmp/hyprexitwithgrace.log 2>&1

    #    notify-send "power controls" "Closing Applications..."

    sleep 2

    COUNT=$(hyprctl clients | grep -c "class:")
    if [ "$COUNT" -eq "0" ]; then
        notify-send "power controls" "Closed Applications."
        return
    else
        notify-send "power controls" "Some apps didn't close. Not shutting down."
        exit 1
    fi
}

case "$1" in
    shutdown)
        close_apps
        systemctl poweroff
        ;;

    reboot)
        close_apps
        systemctl reboot
        ;;

    logout)
        close_apps
        #hyprctl dispatch exit
        loginctl kill-user "$(whoami)"
        ;;

    *)
        echo $"Usage: $0 {shutdown|logout|reboot}"
        exit 1
        ;;
esac

# vim: set ts=4 sw=4 et:
