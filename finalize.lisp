(in-package #:stumpwm-init)

;;(setf *mouse-focus-policy* :click)

(run-shell-command "xsetroot -cursor_name left_ptr -solid black -name root-window")

;;(run-shell-command "~/.screenlayout/main.sh")

(run-shell-command "/usr/bin/gnome-panel")

(run-shell-command "ss-qt5")
(run-shell-command "redshift")
(stumpwm:run-commands "terminal" "firefox" "slack" "emacs")
