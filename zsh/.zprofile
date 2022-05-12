if [ "$(tty)" = "/dev/tty1" ]; then
    exec sway &> /dev/null
fi
