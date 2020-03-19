(in-package :stumpwm-init)

(defcommand swank () ()
	    (ql:quickload :swank)
	    ;;(swank-loader:init)
	    (swank:create-server :port 4004
				 :style swank:*communication-style*
				 :dont-close t)
	    (stumpwm:echo-string (current-screen)
			 "Starting swank. M-x slime-connect RET RET, then (in-package stumpwm)."))
