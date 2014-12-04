#!/bin/bash

export DISPLAY=:99

Xvfb :99 -shmem -screen 0 1366x768x16 &
x11vnc -passwd jenkins -display :99 -N -forever &
/usr/sbin/sshd -D &
# selenium must be started by a non-root user otherwise chrome can't start
su - seleuser -c "/usr/bin/start-selenium"
