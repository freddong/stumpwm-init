(asdf:defsystem #:stumpwm-init
  :description "My custom stumpwm init."
  :author "Spenser Truex <web@spensertruex.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t ;; TODO: Not serial.

  ;; TODO: Weakly depends on (but not, since that is deprecated)?
  :depends-on (;; quicklisp
               :alexandria
               :cffi
	       :swank
               :stumpwm
               :percent-encoding

               ;; stumpwm-contrib
               :shell-command-history
               :command-history
               :browse
               :pass)
  :components ((:file "package")
               (:file "init")
               (:file "util")
               (:file "config")
               (:file "commands")
               (:file "keybindings")
               (:file "dev")
               (:file "finalize")))
