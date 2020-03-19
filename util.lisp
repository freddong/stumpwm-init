(in-package #:stumpwm-init)

;;(defun get-volume ()
;;  (string-trim
;;   (string #\newline)
;;   (run-shell-command "amixer sget Master | grep 'Right:' | awk -F'[][]' '{ print $2, $4 }' &" t)))
