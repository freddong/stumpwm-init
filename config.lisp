(in-package #:stumpwm-init)


(stumpwm:clear-window-placement-rules)
;;(stumpwm:define-frame-preference "Default"
;;			 (2 t t :class "Gnome-terminal")
;;			 (2 t t :class "jetbrains-ide")
;;			 (2 t t :class "jetbrains-pycharm-ce")
;;
;;			 (3 t t :class "Firefox")
;;
;;			 (3 nil t :class "Tusk")
;;			 (3 nil t :class "Slack")
;;			 )
;;
(stumpwm:gnewbg "utils")
(stumpwm:define-frame-preference "utils"
  )

(setf *mode-line-timeout* 10)
(setf *mode-line-foreground-color* "#98BDFB")
(setf *mode-line-border-color* "#000000")
(setf *mode-line-background-color* "#191919")
(setf *mode-line-foreground-color* "#98BDFB")

;;(stumpwm:set-focus-color "#98BDFB")
;;(stumpwm:set-unfocus-color "#000000")
;;(setf stumpwm:*normal-border-width* 4)

;(setf battery-portable:*prefer-sysfs* nil)

(setf *time-modeline-string* "%a %b %e %k:%M")
(setf *screen-mode-line-format*
      (list "[^B%n^b] %W^>"
            ;;"   Vol:"   '(:eval (get-volume))
	    "| %d %B |          "))
(setf *window-format* "%m%n%s%c")

;; Since this is bound to a key by default in this configuration, it is nice to
;; warn the user before closing everything. *prompt-on-quit* only exists on the
;; latest git version as of 2019-12-07, so we need to make sure it exists first.
(when (apropos :*prompt-on-quit* (find-package :stumpwm) t)
  ;; FIXME: Should not need to use eval! Or execute the setf around 2021 without
  ;; the condition above.
  (eval (read-from-string "(setf stumpwm:*prompt-on-quit* t)")))

(defparameter *window-class-renumber*
  '(
    ("konsole" . 0)
    ("Firefox" . 1)
    ("Emacs" . 2)
    ("Slack" . 3)
    )
  "Alist of window classes to be renumbered, and their target numbers.")

(defun renumber-window-by-class (win)
  "Renumber window if its class matches *window-class-renumber*."

  (let* ((class (stumpwm:window-class win))
         (target-number (cdr (assoc class *window-class-renumber*
                                    :test #'string=))))

    (when target-number
      (let ((other-win (find-if #'(lambda (win)
                                    (= (stumpwm:window-number win) target-number))
                                (stumpwm:group-windows (stumpwm:window-group win)))))
        (if other-win
            (when (string-not-equal class (stumpwm:window-class other-win))
              ;; other window, different class; switch numbers
              (setf (stumpwm:window-number other-win) (stumpwm:window-number win))
              (setf (stumpwm:window-number win) target-number))
            ;; if there's already a window of this class, do nothing.
            ;; just keep the new number for this window.

            ;; else: no other window; target number is free.
            (setf (stumpwm:window-number win) target-number))

        ;; finally
        ;;(update-all-mode-lines)
	))))

(stumpwm:add-hook stumpwm:*new-window-hook* 'renumber-window-by-class)

