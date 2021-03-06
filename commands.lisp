(in-package #:stumpwm-init)
(defvar *xterm-font-pt* 12
  "The font size to call xterm with.")
(defvar *xterm-font* nil
  "The font to call xterm with. Either a string (eg. \"Hack\") or NIL for
none.")
(defcommand xterm (&optional additional-argstr) ()
  "Call xterm with a couple of settings arguments."
  (run-shell-command
   (concatenate 'string
                "xterm"
                (if *xterm-font*
                    (concatenate 'string " -fa '" *xterm-font* "'")
                    "")
                " " "-fs " (format nil "~D" *xterm-font-pt*)
                " " additional-argstr)))

(defvar *toggle* nil)
(defvar *my-mouse* "ETPS/2 Elantech Touchpad")
(defcommand poison () ()
  "Turn the rat all the way OFF (or back on): .
(useful if the touchpad is sensitive while typing)."
    (banish)
    (run-shell-command
     (concatenate 'string
                  "xinput --"
                  (if *toggle*
                      "disable"
                      "enable")
                  " '" *my-mouse* "'"))
  (setf *toggle* (not *toggle*)))
