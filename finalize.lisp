(in-package #:stumpwm-init)

;;(setf *mouse-focus-policy* :click)

(run-shell-command "xsetroot -cursor_name left_ptr -solid black -name root-window")

;;(run-shell-command "~/.screenlayout/main.sh")
(toggle-mode-line (current-screen)
                  (current-head))

;;(run-shell-command "/usr/bin/gnome-panel")

(stumptray::stumptray)

;;(run-shell-command "ss-qt5")
(run-shell-command "redshift-gtk")
(run-shell-command "gtk-launch dropbox")
(stumpwm:run-commands "terminal" "firefox" "slack" "emacs")
