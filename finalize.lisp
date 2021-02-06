(in-package #:stumpwm-init)

(setf *mouse-focus-policy* :click)

;; Electron apps (specifically Discord and Slack) receiving notifications causes windows to not appear https://github.com/i3/i3/issues/3130
(run-shell-command "dunst")

(run-shell-command "fcitx")
(run-shell-command "xsetroot -cursor_name left_ptr -solid black -name root-window")

(run-shell-command "~/.custom_touchpad")

;;(run-shell-command "~/.screenlayout/main.sh")
(toggle-mode-line (current-screen)
                  (current-head))

;;(run-shell-command "/usr/bin/gnome-panel")

(stumptray::stumptray)

;; 等待fcitx启动
(sleep 1)

;; last
(run-shell-command "redshift-gtk")
(run-shell-command "gtk-launch dropbox")
(stumpwm:run-commands "terminal" "firefox" "slack" "emacs")
(run-shell-command "gtk-launch thunderbird")
