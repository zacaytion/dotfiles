#!/usr/bin/env bash

# Send bell to the current TTY to trigger tab decoration
printf '\a' >/dev/tty

# Notify when Claude finishes a task and is waiting for input
osascript -e 'display notification "Claude needs your attention" with title "Claude Code" sound name "Sonar"'

exit 0
