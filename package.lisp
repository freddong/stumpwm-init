(defpackage #:stumpwm-init
  (:use #:cl)
  (:import-from :alexandria :once-only)
  (:import-from
   :stumpwm
   :banish
   :current-screen
   :current-head
   :current-window
   :defcommand
   :define-key
   :define-remapped-keys
   :kbd
   :*mode-line-background-color*
   :*mode-line-border-color*
   :*mode-line-foreground-color*
   :*mode-line-foreground-color*
   :*mode-line-timeout*
   :*root-map*
   :run-shell-command
   :*screen-mode-line-format*
   :set-prefix-key
   :toggle-mode-line
   :*top-map*
   :*window-format*)
  (:export
   next-window-same-class
   ))
