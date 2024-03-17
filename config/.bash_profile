#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export QT_QPA_PLATFORM="wayland"
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"

export XDG_CURRENT_DESKTOP=sway

export MOZ_ENABLE_WAYLAND=1

export _JAVA_AWT_WM_NONREPARENTING=1

export VDPAU_DRIVER=radeonsi
export LIBVA_DRIVER_NAME=radeonsi
